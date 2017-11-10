---
layout: post
title: Multi-platform Projects with Kotlin
status: published
type: post
published: true
comments: true
---

[Kotlin 1.2](https://blog.jetbrains.com/kotlin/2017/11/kotlinconf-keynote-recap/) brings with it experimental support for [multi-platform projects](https://kotlinlang.org/docs/reference/multiplatform.html) and last week at [KotlinConf](https://kotlinconf.com) we showed how you can now
use Kotlin to target the Jvm, the Web, Android and iOS. The [source code](https://github.com/JetBrains/kotlinconf-app) for the actual KotlinConf is availabe on GitHub, and while it's a great example
of multi-platform project, it's got a lot of moving pieces and opening it for the first time can be overwhelming. 

<br/>
I'm currently preparing a two week road trip to Asia, and one of the things I'll be talking about is precisely MPPs. So I've prepared a very simple sample project which is now available on [GitHub](https://github.com/hhariri/kotlin-mpp-sample), and in this
blog post I'll walk you through the different parts.

## Project Structure

The project consists of three modules:

* **common** module for shared code
* **js** module targeting JavaScript
* **jvm** module targeting the JVM



### common module

This module contains all common shared code, and should be limited to Kotlin. 

<br/>
In the case of a data classes, usually the implementation is the same
whether targeting the JVM, JavaScript or other platforms. In our case, we have this as part of the package `com.hadihariri.multiplatform.common.data`.

<br/>
![Project Layout]({{ site.images }}/mpp-1.png)
<br/>

#### expect and actual 

There are times when we still need to share common code, but have different behaviours on different platforms, since the implementation touch
platform-specific calls and/or libraries. 

<br/>
That's where the **expect** and **actual** keywords come in to play and this is the module where we need to define them. If you recall C/C++, think of them as headers and implementations. We can mark any class or functions with the keyword
**expect** to indicate that the code is present, but the **actual** implementation will be provided in each specific module. How we link these modules and make the compiler aware of it all, we'll see in a bit. 

<br/>
In our case, we're going to define a class called `Date` and a function called `platformMessage`, and place these in the `com.hadihariri.multiplatform.common` package.

<br/>
![Platform Specific Shared Code]({{ site.images }}/mpp-2.png)
<br/>


<br/>
The code itself would be

```kotlin
package com.hadihariri.multiplatform.common

import com.hadihariri.multiplatform.common.data.*


expect class Date() {
    fun getDate(): Int
    fun getMonth(): Int
    fun getFullYear(): Int
    fun getHours(): Int
    fun getMinutes(): Int
    fun getTime(): Number
}

expect fun platformMessage(message: Message)
```

Again, notice how there's not implementation yet.

#### **actual** implementations

As soon as we do this, IntelliJ IDEA will display an error, along with an Intention, indicating that the implementation for these declarations are missing

<br/>
![Implement actual]({{ site.images }}/mpp-3.png)


<br/>
We need to 

### Platform specific modules

In addition to the common module, we also have platform specific modules. In our case, since we're targeting Jvm and JavaScript, we have two. In each of these we'll have 
Kotlin code that can talk and interop with platform libraries and languages. In addition we'll have the **actual** implementations of our **expect** declarations declared in the common module.

<br/>
In our case, this would be the implementations for the `Data` class and the `platformMessage` function

```kotlin
package com.hadihariri.multiplatform.common

import com.hadihariri.multiplatform.common.data.*

actual fun platformMessage(message: Message) {
    println("(JVM) [${message.priority}] ${message.priority}")

}
```

```kotlin
package com.hadihariri.multiplatform.common

actual class Date  {
    actual constructor()
    actual fun getDate(): Int {
        ...
    }
    ...
}
```

One important thing to note here: the code should be declared in the **same** package as it is defined in the common module. If we see our project structure
we can see how we have a common and a jvm package defined in the jvm module

<br/>
![Jvm Structure]({{ site.images }}/mpp-4.png)
<br/>

<br/>

## Linking modules with Gradle

One piece missing in this picture is how we link the Gradle projects together so that they correctly identify the dependencies between modules. It's similar to the `compile` directive in Gradle
which allows one project to be referenced by another 

```groovy
dependencies {
    compile project(':common')
```

except in this case, instead of `compile`, we use `expectedBy`

```groovy
dependencies {
    expectedBy project(':common')
```

## Starting a new MP project in IntelliJ IDEA

Currently multi-platform projects are only supported using Gradle. In IntelliJ IDEA, we can create the necessary modules using the New Module wizard

<br/>
![Wizard]({{ site.images }}/mpp-5.png)
<br/>

<br/>
We first start by creating a general Gradle module, and then add a module per target platform (which then defines the correct dependencies). Currently the `expectedBy` relationship needs to be set manually.


<br/>
Once again, the complete source code for the sample project is [available on GitHub](https://github.com/hhariri/kotlin-mpp-sample)
