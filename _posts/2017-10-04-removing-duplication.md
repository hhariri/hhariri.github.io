---
layout: post
title: Removing Duplication. Introducing Duplication. Removing Duplication.
status: published
type: post
published: true
comments: true
---

Take this code 

```kotlin
fun Route.session() {
    get("/sessions/{date}") {
        val sessionData = SessionData()
        val date = if (call.parameters["date"] != null) {
            try {
                DateTime.parse(call.parameters["date"], DateTimeFormat.forPattern("dd-MM-yy"))
            } catch (e: Exception) {
                call.respond(HttpStatusCode.BadRequest)
            }
        } else {
            DateTime.now()
        }
        call.respond(sessionData.sessionsByDay(date))
    }

    get("/sessions/current/{date}") {
        val sessionData = SessionData()
        val date = if (call.parameters["date"] != null) {
            DateTime.parse(call.parameters["date"], DateTimeFormat.forPattern("dd-MM-yy-hh-mm"))
        } else {
            DateTime.now()
        }
        call.respond(sessionData.currentSessions(date))
    }
}
```

Lot of duplicate code there. Let's extract the date parsing into a new function

```kotlin
fun parseDate(value: String?, format: String): Date? {
    return if (value != null) {
        return try {
            DateTime.parse(value, DateTimeFormat.forPattern(format))
        } catch (e: Exception) {
            return null
        }
    } else {
        DateTimeParse.Success(DateTime.now())
    }
}
```

Hmm, don't like nulls. Let's use a sealed class to represent an Algebraic Data Type

```kotlin
sealed class DateTimeParse {
    class Success(val dateTime: DateTime) : DateTimeParse()
    class Failure(val message: String) : DateTimeParse()
}

fun parseDate(value: String?, format: String): DateTimeParse {
    return if (value != null) {
        return try {
            DateTimeParse.Success(DateTime.parse(value, DateTimeFormat.forPattern(format)))
        } catch (e: Exception) {
            DateTimeParse.Failure("Failed to parse date")
        }
    } else {
        DateTimeParse.Success(DateTime.now())
    }
}
```

Now let's use this code

```kotlin
fun Route.session() {
    get("/sessions/{date}") {
        val sessionData = SessionData()
        val dateParsedResult = parseDate(call.parameters["date"], "dd-MM-yy")
        when (dateParsedResult) {
            is DateTimeParse.Success -> call.respond(sessionData.sessionsByDay(dateParsedResult.dateTime))
            is DateTimeParse.Failure -> call.respondText(text = dateParsedResult.message, status = HttpStatusCode.BadRequest)
        }
    }

    get("/sessions/current/{date}") {
        val sessionData = SessionData()
        val dateParsedResult = parseDate(call.parameters["date"], "dd-MM-yy-hh-mm")
        when (dateParsedResult) {
            is DateTimeParse.Success -> call.respond(sessionData.currentSessions(dateParsedResult.dateTime))
            is DateTimeParse.Failure -> call.respondText(text = dateParsedResult.message, status = HttpStatusCode.BadRequest)
        }
    }
}
```

We've introduced new duplication. Let's refactor

```kotlin
sealed class DateTimeParse {
    class Success(val dateTime: DateTime) : DateTimeParse()
    class Failure(val message: String) : DateTimeParse()
}

fun parseDate(value: String?, format: String): DateTimeParse {
    return if (value != null) {
        return try {
            DateTimeParse.Success(DateTime.parse(value, DateTimeFormat.forPattern(format)))
        } catch (e: Exception) {
            DateTimeParse.Failure("Failed to parse date")
        }
    } else {
        DateTimeParse.Success(DateTime.now())
    }
}

fun Route.session() {
    get("/sessions/{date}") {
        processSessionRequest(::sessionsByDay, "dd-MM-yy")
    }

    get("/sessions/current/{date}") {
        processSessionRequest(::currentSessions, "dd-MM-yy-hh-mm")
    }
}

private suspend fun PipelineContext<Unit>.processSessionRequest(f: (DateTime) -> List<Session>, dateFormat: String) {
    val dateParsedResult = parseDate(call.parameters["date"], dateFormat)
    when (dateParsedResult) {
        is DateTimeParse.Success -> call.respond(f(dateParsedResult.dateTime))
        is DateTimeParse.Failure -> call.respondText(text = dateParsedResult.message, status = HttpStatusCode.BadRequest)
    }
}
```

This is the default refactoring that IntelliJ IDEA offers when we select

```kotlin
val sessionData = SessionData()
val dateParsedResult = parseDate(call.parameters["date"], "dd-MM-yy-hh-mm")
when (dateParsedResult) {
    is DateTimeParse.Success -> call.respond(sessionData.currentSessions(dateParsedResult.dateTime))
    is DateTimeParse.Failure -> call.respondText(text = dateParsedResult.message, status = HttpStatusCode.BadRequest)
}
```


and tell it to extract function. 

<br/>
The only "manual" refactoring is that ```sessionsByDay``` and ```currentSessions``` are now top-level functions. They no longer belong to a class SessionData. Given this class had no state, only behaviour, [why class?](http://hadihariri.com/2013/11/24/refactoring-to-functionalwhy-class/)
                                 

<br/>
But something just isn't right. It's introduced a class that really has no place in my code, i.e. ```PipelineContext```. 


<br/>
Let's leverage Kotlin's extension functions and make ```processSessionRequest``` an extension function to ```call```


```kotlin
suspend fun ApplicationCall.respondSessionRequest(f: (DateTime) -> List<Session>, dateFormat: String) {
    val dateParsedResult = parseDate(parameters["date"], dateFormat)
    when (dateParsedResult) {
        is DateTimeParse.Success -> respond(f(dateParsedResult.dateTime))
        is DateTimeParse.Failure -> respondText(text =  dateParsedResult.message, status = HttpStatusCode.BadRequest)
    }

}
```


The result

```kotlin
sealed class DateTimeParse {
    class Success(val dateTime: DateTime) : DateTimeParse()
    class Failure(val message: String) : DateTimeParse()
}

fun parseDate(value: String?, format: String): DateTimeParse {
    return if (value != null) {
        return try {
            DateTimeParse.Success(DateTime.parse(value, DateTimeFormat.forPattern(format)))
        } catch (e: Exception) {
            DateTimeParse.Failure("Failed to parse date")
        }
    } else {
        DateTimeParse.Success(DateTime.now())
    }
}

fun Route.session() {
    get("/sessions/{date}") {
        call.respondSessionRequest(::sessionsByDay, "dd-MM-yy")
    }

    get("/sessions/current/{date}") {
        call.respondSessionRequest(::currentSessions, "dd-MM-yy-hh-mm")
    }
}


suspend fun ApplicationCall.respondSessionRequest(f: (DateTime) -> List<Session>, dateFormat: String) {
    val dateParsedResult = parseDate(parameters["date"], dateFormat)
    when (dateParsedResult) {
        is DateTimeParse.Success -> respond(f(dateParsedResult.dateTime))
        is DateTimeParse.Failure -> respondText(text =  dateParsedResult.message, status = HttpStatusCode.BadRequest)
    }

}
```

*(Note: *suspend is necessary since we're inside coroutines)*

<br/>
In summary, we've introduced a few new types, added some more code, but in turn we've removed all duplication and as a consequence, any changes or updates will only be done once. 

<br/>
What are your thoughts? Worth it or not?

