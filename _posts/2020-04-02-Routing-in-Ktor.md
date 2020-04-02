---
layout: post
title: Routing in Ktor
status: published
type: post
published: true
comments: true   
---

One of [Ktor's](https://ktor.io) strong points is in the flexibility it offers in terms of structuring your application. Different to many other server-side frameworks,
it doesn't force you into a specific pattern such as having to place all cohesive routes in a single class name `{XZY}Controller` for instance.

<br/>
Of course, not being forced into using a specific pattern also has its downsides. How am I meant to structure my app? What's the best convention to follow?

<br/>
<br/>
I recently asked the same question on Twitter
<br/>
<br/>
<blockquote class="twitter-tweet"><p lang="en" dir="ltr">If you&#39;re using Ktor for server-side, how do you organise your routes? If other, please feel free to reply below. Also RT appreciated.</p>&mdash; Hadi Hariri (@hhariri) <a href="https://twitter.com/hhariri/status/1243493271105667072?ref_src=twsrc%5Etfw">March 27, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br/>
and the results were somewhat surprising - didn't expect 25.3% of folks to put them all into a single routing function. For anything beyond a simple application
this could get quite ugly quite quickly. 

<br/>
<br/>
But it did get me thinking in that maybe it would be good to provide some different samples of how one could
structure an application.

<br/>
<br/>
For our example we're going to assume that our application deals with Customers and Orders. 

## Defining routes

Before we talk about how we can group routes, let's first discuss ways in which we can define them. Something which is again quite flexible in Ktor. 

<br/>
Generally routes are defined using the `routing` function. We can then create routes using verbs and paths


<br/>
<br/>

```kotlin
routing {
    get("/customer/{id}") {

    }
    post("/customer") {

    }
    get("/order/{id}") {
    
    }
}
```

<br/>
or we can group routes by URL 
<br/>


```kotlin
routing {
    route("/customer") {
        get {

        }

        post {

        }
    }
}
```

<br/>
and of course we can also have sub-routes
<br/>

```kotlin
routing {
    route("/order") {
        route("/shipment") {
            get {
                
            }
            post {
                
            }
        }
    }
}
```

### Using Route Extension Functions

A common pattern is to use extension functions on `Route` to define the actual routes, allowing us easy access to the verbs, and remove clutter
of having all routes in a single `routing` function. We can apply this pattern independently of how we decide to group routes. As such, the first example
could be represented in a cleaner way 

```kotlin
routing {
    customerByIdRoute()
    createCustomerRoute()
    orderByIdRoute()
    createOrder()
}

fun Route.customerByIdRoute() {
    get("/customer/{id}") {

    }
}

fun Route.createCustomerRoute() {
    post("/customer") {

    }
}

fun Route.orderByIdRoute() {
    get("/order/{id}") {
    
    }
}

fun Route.createOrder() {
    post("/order") {

    }
}
```

This now leads us to the question at hand - how do we group these routes? We certainly don't want everything in a single file. 

## Grouping by file

The most voted-for solution is grouping routes that are related in a single file. In our case, this would mean having a `CustomerRoutes` and an
 `OrderRoutes` file for instance

<br/>

**CustomerRoutes.kt**

```kotlin
fun Route.customerById() {
    get("/customer/{id}") {

    }
}

fun Route.createCustomer() {
    post("/customer") {

    }
}
```

**OrderRoutes.kt**

```kotlin
fun Route.orderByIdRoute() {
    get("/order/{id}") {
    
    }
}

fun Route.createOrderRoute() {
    post("/order") {

    }
}
```

What would happen with sub-routes? Such as `order/shipment` for instance? It somewhat depends on what we understand by this URL. If we're talking about
these as resources (which they are), `shipment` itself could therefore be a resource, and could easily map to another file `ShipmentRoutes.kt`.

<br/>

### Grouping routing definitions 

One advantage of this approach is that we can also group the routing definitions, and potentially features, per file. For instance, let's assume that we follow the group per file layout as above. Even though
are routes in a different files, we need to declare them at Application level. As such our app would look something like the following

```kotlin
routing {
    customerByIdRoute()
    createCustomerRoute()
    orderByIdRoute()
    createOrderRoute()
}
```

If we have tons of routes in our app, this could quickly become long and cumbersome. Since we have however routes grouped
by file, we can take advantage of this and define the routing in each file also. For this we could 
create an extension for `Application` and define the routes

**CustomerRoutes.kt**

```kotlin
fun Application.customerRoutes() {
    routing {
        customerByIdRoute()
        createCustomerRoute()    
    }    
}
```

**OrderRoutes.kt**

```kotlin
fun Application.orderRoutes() {
    routing {
        orderByIdRoute()
        createOrderRoute()
    }
}
```

<br/>
Now in our actual `Application.module` startup, we'd simply call these functions, without the need for `routing` block

```kotlin
fun Application.module() {
    // Init....
    customerRoutes()
    orderRoutes()
}
```

<br/>
We can even take this one step further - install features per application, as needed, especially for instance when
we're using the `Authentication` feature which depends on specific routes. One important note however is that Ktor will
detect if a feature has been installed twice by throwing an `DuplicateApplicationFeatureException` exception.

### A note on using objects

Using objects to group routing functions doesn't provide any kind of performance or memory benefits, as top-level functions in 
Ktor are instantiated a single time. While it can provide some sort of cohesive structure where you may want to share
common functionality, it isn't necessary to use objects in case you're worried about any kind of overhead.


## Grouping by folders 

One disadvantage of the above two solutions is that if our route handlers are somewhat complicated (read long), having everything in a single file can become a bit cumbersome.
What we could do instead is use folders (i.e. packages) to define different areas and then have each route in its own file. 

<br/>

![Grouping by Folders Project Layout]({{ site.images }}/ktor-routing-1.png)

<br/>

While this certainly does provide the advantage of a nice layout when it comes to routes and the 
individual actions, it could certainly lead to “package overload”, and potentially having tons of 
filenames named the same, making navigation somewhat more difficult. On the other hand, as we’ll see 
in the next example, we could also merely prefix each file with area (i.e. CustomerCreate.kt for instance).

## Grouping by features

If you've ever worked with frameworks such as ASP.NET MVC (or Ruby on Rails), you may be familiar with the concept of structuring applications using 
three folders - Model, View, and Controllers (Routes). 

<br/>

![Model View Routes]({{ site.images }}/ktor-routing-2.png)

<br/>

This isn't far-fetched with the schema we have above which is grouping routes in their own packages/files, our views in the `resources` folder in the case
of Ktor, and of course, nothings prevents us from having a package `model` where we place any data we want to display or respond to HTTP endpoints with.

<br/>
But it does beg the question - is this actually the best approach? Wouldn't it make sense to group things by features as opposed to the infrastructure-level
functionality? i.e. instead of having the project distributed by `routes`, `models` and `views`, have these groups by specific behaviour/features, i.e. 
`OrderProcessPayment`, `CustomerAddressChange`, etc. 

<br/>

![Change Address Layout]({{ site.images }}/ktor-routing-3.png)

<br/>

With many frameworks, this kind of organization of code isn't viable without seriously hacking the underlying conventions. However with Ktor, given
how flexible it is, in principle it shouldn't be a problem. With one caveat - when we're using a template engine, resources could be an issue. But let's 
see how we could solve this. 

<br/>
How this problem is solved very much depends on what is used for Views. If our application is merely an HTTP backend and we're using 
client-side technology, then this is a no-brainer as usually all rendering is client-side. If we're using Kotlinx.HTML, then once again it's not
an issue as the page can be generated from any Kotlin file placed anywhere. The issue arises more when we're using a templating engine
such as [FreeMarker](https://freemarker.sourceforge.io/). These are peculiar in how and where template files should be located. Fortunately
some of them offer flexibility in how templates are loaded. 

<br/>
For instance with FreeMarker, we can use a `MultiTemplateLoader` and then have templates loaded from different locations
 
```kotlin
install(FreeMarker) {
    val customerTemplates = FileTemplateLoader(File("./customer/changeAddress"))
    val loaders = arrayOf<TemplateLoader>(customerTemplates)
    templateLoader = MultiTemplateLoader(loaders)
}
```


<br/>
Obviously this code isn't ideal as it uses relative paths amongst other things, but it's not hard to see how we could actually
have this loop through folders and load templates, or even have a custom build action that copies views to our `resources` folder prior
to execution. There are quite a number of ways to solve the issue. 

<br/>
The benefit of this approach is that we can group everything related to the same functionality in a single location, by feature, as opposed to
the technical/infrastructure aspect of it. 


## Whatever works for you...

As we can see, Ktor is extremely flexible when it comes to not only how we define routes but how we group
and structure them. Each have their own benefits and disadvantages, and ultimately I'd recommend using one
that works best for you in your scenario. 

<br/>
If you have other approaches, would love to hear about them though. Please feel free to leave some comments!

 

 



   