---
layout: post
title: Introducing Spek - A Specification Framework for the JVM
status: published
type: post
published: true
comments: true
---

### A Specification Framework

Some time ago I started working on a [specification framework for the JVM](http://jetbrains.github.io/spek), something that allows me to write specifications (i.e. tests) in a more
human readable way, and what's more important, descriptive manner, without having to resort to underscores or very long test names.

It's now reached its first milestone, not without the efforts of [Ilya](http://twitter.com/orangy), [Eugene](http://twitter.com/jonyzzz) and [Steve](https://plus.google.com/111179551284404865949/about), and now
in a state that it can be used in applications.

### Spek

If you're familiar with Jasmine, Mocha, Cucumber or Machine Specifications, then you'll immediately see the resemblance

![Spek Example]({{ site.images }}/spek-1.png)

If you're not familiar, let me briefly explain:

* **Given** - Establish the context of the test, i.e. Arrange
* **On** - Execute the action, i.e. Act
* **It** - Validate the restuls, i.e. Assert


Spek allows you to have more than one action for the same context, that is for the same given. It also allows you to have more than one *it* for the same
action. It's good practice (well I say so), that you keep each *it* with a single assertion.

### What language is that?

Spek is written in Kotlin, but your code doesn't need to be. Kotlin is 100% compatible with Java, which means that you can test/write your specifications in Kotlin
and keep your code in Java (if you really wnat to that is).

### How do I run it?

IntelliJ IDEA supports Spek, so does TeamCity. There's also a console runner which outputs Text and HTML (still in the works).

![Spek Runner]({{ site.images }}/spek-2.png)

### What next?

Hoping that you like what you see, head over to the [Spek web site](http://jetbrains.github.io/spek) to find out more and download it. It's Apache 2 OSS license
and source code is available on GitHub.

Oh, and in case you're wondering whether this is a BDD Framework, I believe [BDD is more about the conversations and context than anything else](http://hadihariri.com/2012/04/11/what-bdd-has-taught-me/). If
you could call this anything, call it a Specification Framework, i.e. you're providing executable specifications for your application.













