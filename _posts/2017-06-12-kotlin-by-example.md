---
layout: post
title: Kotlin by Example 
status: published
type: post
published: true
comments: true
---

Over the weekend, I've thrown together a new site, [Kotlin by Example](http://kotlinbyexample.org), which is dedicated to teaching Kotlin using short
 annotated examples. The idea came from [Go By Example](https://gobyexample.com) which I'd used somewhat in the past. 

<br/>

![Kotlin by Example Site]({{ site.images }}/kotlin-by-example-1.png)

<br/>
While currently there are only a few samples (and I'm planning on adding more), most of the effort has gone into setting up an infrastrucutre that makes it easy
for collaboration. When I ran the idea of setting up the site by some community members, a few them wanted to actually contribute with content, so my main goal was to make this as 
 simple as possible. 

## Compiling Documentation

While GitHub makes it easy to collaborate with documentation using GitHub Pages, the main issue is that every new submission must have correct Kotlin code in it. Mentally compiling 
the code during a code review or copy/pasting it to get it to compile isn't an option, especially when the code is annotated

```asciidoc
[source,kotlin]
----
fun main(args: Array<String>) {
    println("Hello!") <1>
}
----
<1> Writes to standard output
```

### Meet mark-code

Say hello to *mark-code*

<br/>

*mark-code* is a project I recently [pushed to GitHub](https://github.com/hhariri/mark-code). It was originally written by [Dmitry](https://twitter.com/intelliyole) for the [Kotlin in Action](https://www.manning.com/books/kotlin-in-action) book. 
 The idea behind it is quite simple - make sure that the source code used in the book compiled correctly, optionally verifying the output produced. 
 
<br/>
The tool currently works with [AsciiDoc](http://asciidoctor.org) which is a great markup language for writing technical documentation, but adding Markdown support is on the list. The way it works 
is actually quite straightforward - you simply run your AsciiDoc source files through the tool and it generates the corresponding Kotlin (it supports Java to a certain extent too) files, which are then validated for correct
code.

```asciidoc
[source,kotlin]
----
println("Hello, World!") <1>
----
<1> Write "Hello, World!" to standard output
```
would generate

```kotlin
package helloworld.exkt

fun main(args: Array<String>) {
    println("Hello, World!")
}
```

It also allows us to optionally run and verify any output

```asciidoc
[source,kotlin]
----
fun sum(x: Int, y: Int) = x + y <1>
>>> println(sum(2,3))
5
----
<1> Single-expression functions are kind of nice!
```
 
## Contributing 

If you'd like to collaborate (awesome!), all you'd need to do is write examples as single AsciiDoc files and submit a Pull Request. Once the contents is reviewed,
it's then [built, verified and published by TeamCity](https://teamcity.jetbrains.com/project.html?projectId=Kotlinbyexample), so neither you nor I have to do any manual checks! 

<br/>

![Kotlin By Example - TeamCity]({{ site.images }}/kotlin-by-example-2.png)

<br/>

For more details on contributing, check out the [Collaborating section](https://kotlin.github.io/kotlinbyexample/#_contributing) on the site. Apart from the contents, all ideas on improving *mark-code* or the process itself are of course also welcome! 




 


