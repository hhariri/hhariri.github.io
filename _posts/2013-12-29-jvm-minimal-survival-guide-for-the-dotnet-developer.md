---
layout: post
title: JVM Minimal Survival Guide for the .NET Developer
status: draft
type: post
published: true
---

**Last updated:** 29 December, 2013

* Test
{:toc}

## Why this Guide

When you come to a new platform, from a similar one, you often spend time trying to get up to speed with concepts/frameworks you know, but you don't know, because they go by a different name, a different approach.
It's time-consuming and sometimes even frustrating. This guide is an attempt to help others avoid some of those newbie questions.

This guide is also to help me, as I'm sure I've made and will make mistakes, so please let me know if you see any errors. Or better yet, send me a [pull request](http://github.com/hhariri/hhariri.github.io)

### Work in progress

While it is a blog post, it is also a page that I will update as and when I come across new things. At the top is the latest updated date.

### Target Audience

Although the title says "for the .NET Developer", this guide is for anyone that is new to the JVM platform. While there will be some comparison to the .NET platform, it is not
exclusively targeted at .NET Developers.

## The Basics

### Java the language. Java the ecosystem. Java the JVM.

They are different. One thing is the language (think C#), another the ecosystem (think .NET ecosystem), another the platform (think CLR).
Unfortunately it seems Java is commonly used to refer to all three.
Don't let one put you off the other. I don't like Java as a language, but the Java ecosystem is very active and a lot of innovation is happening. In fact, as a .NET Developer
you're probably familiar with libraries such as NHibernate, NUnit, NLog, NAnt, etc. all of which originate from the Java ecosystem
(drop the N).

### A Multi-language platform

Think of the JVM as the CLR. Both are virtual machines that provide a platform for multiple languages. They have their differences of course, but both host multiple languages.
While on the CLR, we mostly have C#, VB.NET (a dying breed) and F#, on the JVM there is Java, Scala, Clojure, Ceylon, Groovy, JRuby and Kotlin just to [name a few](http://en.wikipedia.org/wiki/List_of_JVM_languages).

### JVM Bytecode

JVM bytecode is what JVM based languages compile down to to run on the JVM. It's similar to IL in .NET.

### Cross Platform

The JVM is 100% cross platform. Apart from Windows, OSX, Linux and Android, it also runs on many other types of devices.

## JVM Implementations, Editions and Versions

The JVM has [multiple implementations](http://en.wikipedia.org/wiki/List_of_Java_virtual_machines). The most common one is Oracle's and OpenJDK. There's even [a .NET implementation called IKVM.NET](http://en.wikipedia.org/wiki/IKVM.NET)

### Editions and Versions

This is probably by far the most complicated section on this guide. It's amazing how you can screw up something as simple as naming/versioning. This even makes Microsoft's product naming look decent.

Here we go:

#### Editions

* **JRE - Java Runtime Environment**. This is for running JVM applications. You can't develop applications running on the JVM with just this.
* **Java SE (JDK) - Java Standard Edition**. Also known as the JDK. This is the minimum you need to develop applications on the JVM.
* **Java EE - Java Enterprise Edition**. Well, name says it all. It's where you get all the Enterprisey stuff like distributed, large-scale applications. Yes, couldn't be more ambiguous. It includes Java SE.
* **Java ME - Java Micro Edition**. This is a smaller subset focused for mobile phones and smaller devices. It's like the .NET Micro Framework.
* **JavaFX** - A newer platform for creating rich Internet applications. Yeah.

As you can deduce, all Java XY's are also JDK's.

Find out more about the [history](http://www.oracle.com/technetwork/java/javase/namechange-140185.html) and [naming](http://www.oracle.com/technetwork/java/javase/jdk7-naming-418744.html)

#### Versions

The currently released version of Java is 7. Java 8 is due out sometime in 2014.

To find out what version of Java you have installed, type

    java -version

You'll get something like this:

    java version "1.7.0_40"
    Java(TM) SE Runtime Environment (build 1.7.0_40-b43)
    Java HotSpot(TM) 64-Bit Server VM (build 24.0-b56, mixed mode)

That's Java 7. Why? Well easy, drop the 1 from 1.7.0_40 and you get 7.0_40. The 0_40 indicates the update pack. For Java 7 see all [releases](http://www.java.com/en/download/faq/release_dates.xml)

Basically 1.5 means Java 5. 1.6 is Java 6. 1.7 is Java 7 and yes, you guessed it, Java 8 will be 1.8.

Yes. I know.


## Installing Java

Once you've figured out which version you want by studying [Editions](#editions-and-versions), go to Oracle's [install guide page](http://www.java.com/en/download/help/index_installing.xml).

Oh, and if you're wondering why you need the Ask Toolbar installed, don't blame Oracle. Apparently it was a deal Sun struck before the buyout. I hear they're not going to renew the deal once it expires.

## Application Output a.k.a Artifacts

Both in .NET as well as native applications, when compiling you usually end up with an executable and/or a series of DLLs. With Java, you get a bunch of
*.class* files in an output folder.

Each class file usually corresponds to a Java class (when compiling Java language or other languages that follow the convention when compiling to bytecode).

These classes are JVM bytecode, which is similar to IL on the CLR.

### JAR Files

Instead of shipping a hundred class files, you can also create a JAR which is nothing more than a zipped up version of the *.class* files. You can create JAR files using
your favorite tool or simply running

    jar cf jar-file input-file(s)


jar ships with the JDK (/bin folder).

### WAR Files

A WAR file is a JAR files for Web Application, [created by Sun](http://en.wikipedia.org/wiki/WAR_file_format_(Sun)). It contains a bunch of class files and some additional
metadata and folders with information for web servers such as TomCat.

## Running Java Applications

Any Java application that has a main class can be run from the command prompt. Type:

    java <class_containing_main_method>

You have to run this from the folder where the *.class* files are.

### Classpath

When running applications, the JVM looks for all necessary dependencies in the current folder and then the CLASSPATH environment variable which points to one or more
folders containing *.class* files or JAR's/ZIP's.

You can set the CLASSPATH environment variable globally, which will then be used by Java or pass it as a command line argument when running an application:

    java <class_containing_main_method> -cp <class_path>


Each entry is separated by a colon.

## Build Tools

In .NET there are many build tools including MS Build, NAnt, Albacore, Fake, etc. The JVM doesn't lag far behind. Although some languages have their own build tools such as
such as Leiningen for Clojure or SBT for Scala, most languages (including the previous) can use more standard build tools.


### Ant

It's XML. It's what NAnt is based on. It's like MS-Build. I did mention though it's XML.

### Maven

Maven is quite popular. When you see a project with a pom.xml file, that's Maven. [Maven is also broken](http://blog.ltgt.net/maven-is-broken-by-design/). Maven is also XML.

However, Maven is more than just a build tool. It's a packaging system. It's like NuGet in .NET, like NPM in Node.js. Much like nuget.org there's also a maven.org. And similar to the whole
"if it's not on nuget.org it doesn't exist", well, kind of the same situation in the Java ecosystem.

Like NuGet, you can also host your own Maven repostiory. [Artifactory](http://www.jfrog.com/home/v_artifactory_opensource_overview) is a product that allows you to do so.

### Gradle

Gradle is a better Maven. It's based on Groovy so you get rid of the horrible XML and offers apparently a better way of managing dependencies.

I'm currently trying to use Gradle more.


### IntelliJ IDEA Build

Albeit an IDE and more belonging in the tools section, IntelliJ IDEA also offers its own build system. However, you're limited to using it in environments that understand it, which is basically
IntelliJ IDEA and TeamCity.

## Frameworks and Libraries

There are far too many frameworks and libraries to list, so I'm going to limit this section to what I've discovered or has been recommended to me based on my own needs. If you
think there are other must-haves, please, send me a [pull request](http://github.com/hhariri/hhariri.github.io).

### JSON Serialization

* [Jackson](http://jackson.codehaus.org/) - It's the one I use. It works well.

### Unit Testing

Quite a few unit testing frameworks:

* [JUnit](http://junit.org) - As standard as it gets. Works well. Supported by pretty much all tools.
* [Spek](http://github.com/hhariri/spek) - Disclaimer. It's my own framework, but since I'm using it, it's worth a mention. Offers a better DSL. At least I think so.
* [JBehave](http://jbehave.org/) - [Dan North's](http://twitter.com/tastapod) original JBehave framework.
* [TestNG](http://testng.org/doc/index.html) - An alternative to JUnit. Not used it myself so can't comment much.

### Mocking Frameworks

I don't do much mocking lately, but I have used one that I found:

* [Mockito](https://code.google.com/p/mockito/)

### Logging

* [SLF4J](http://www.slf4j.org/) - This is the common facade for logging on the JVM platform. Sticking to this allows you to (in theory) swap out logging and allows applications to choose which library they want.

### IoC Containers

* [Guice](https://code.google.com/p/google-guice/) - From Google. It's the one I'm using. It's pretty decent.
* [Spring](http://spring.io/) - From Spring Framework. Apparently you can now use it without XML. Not sure. I don't use it.

### HTTP Clients

Using the standard Apache Commons one. Open to better alternatives.

* [Apache HTTP Client](http://hc.apache.org/httpclient-3.x/) - Using this one. Sorely lacking a wrapper.

### Web Frameworks

A lot of the web frameworks are based off of a [common interface which is the Java Servlet API](http://en.wikipedia.org/wiki/Java_Servlet). Think of it as kind of like [OWIN](http://owin.org/).

Applications can then be hosted on [GlassFish](https://glassfish.java.net/), [Jetty](http://www.eclipse.org/jetty/), [Apache TomCat](http://tomcat.apache.org/).

Oh btw, Oracle announced it will discontinue GlassFish commercial support and its main Evangelist, Arun Gupta, recently left Oracle for RedHate. [He now offers as alternative WildFly](http://blog.arungupta.me/2013/12/webinar-wildfly-for-innovation-redhat-jboss-eap-for-commercial-support/)

A very modern and lightweight option for web development is [Vert.x](http://vertx.io/). Built on [Netty](networking), you can even use different languages such as Java, JavaScript, Ruby.

### Networking

* [Netty](http://netty.io/) - Awesome asynchronous event-driven framework for writing high-performance web applications. It abstracts the communication layer so you can use HTTP, Sockets, et al.

### Other Libraries and Utilities

* [JodaTime](http://www.joda.org/joda-time/) - Date and Time management in Java are horrendously broken. Worse than in .NET. Use JodaTime for sanity. This is where [NodaTime](https://code.google.com/p/noda-time/) from Jon Skeet originates.
* [Reflections](https://code.google.com/p/reflections/) - Making Reflection nicer.
* [Apache Commons](http://commons.apache.org/) - A bunch of small libraries for everyday use.

## Conventions

Although conventions are largely based on the programming language you pick, there are some more or less common conventions

### Namespaces

Namespaces are in reverse order, starting with the top-level domain name, then the company/organization, etc. i.e.

    org.hadihariri.spek.runners

and unfortunately, at some point, it was decided that each segment becomes a folder. Which means that you end up with things like this on GitHub:

![Folder Structure]({{ site.images }}/jvm-guide-1.png)

Fortunately if you use a decent IDE, these will be collapsed and become manageable.

### Property and Method Names

If you're coming from C# and using a language such as Java, Scala or Kotlin, then the conventions are reversed in terms of naming fields, properties, methods. They are all named using lowerCamelCase.
If you end up using Java, [browse through this comparison](http://en.wikipedia.org/wiki/Comparison_of_C_Sharp_and_Java).

## Tooling

When you install the JDK you get a compiler (javac) and a jar creator (jar), javadoc (for creating docs) and a few other goodies. With that and a text editor you can
create and run applications.

### IDE's

There are three main IDE's in the Java space:

* [NetBeans](https://netbeans.org/)
* [Eclipse](https://netbeans.org/)
* [IntelliJ IDEA](http://www.jetbrains.com/idea)

All three are OSS and free. IntellIJ IDEA has an Ultimate Commercial version which is recommended if you want some additional support for frameworks, enterprise features, et al. [Full Comparison](http://www.jetbrains.com/idea/features/editions_comparison_matrix.html)

While Eclipse is probably the most common and extended, my choice is IntelliJ IDEA. And if you like ReSharper, you're going to like it. Of course, you can call me biased.

### Continuous Integration

In terms of Continuous Integration tools, pretty much the same ones that exist in .NET exist on the JVM. In fact, most of them are JVM based.

* [TeamCity](http://www.jetbrains.com/teamcity) - Offers a free edition.
* [Jenkins](http://jenkins-ci.org/) - A spin-off of Hudson


### Random Tools

A collection of tools that I find useful and will add to as I come across them.

* [JRebel](http://zeroturnaround.com/software/jrebel/) - Awesome plugin to IntelliJ IDEA and other IDE's that allows for hot-swapping, i.e run code without re-compiling.
* [YourKit](http://www.yourkit.com/) - Java Profiler

## IntelliJ IDEA for the Visual Studio User

// TODO


## Conferences

I've been going to Java Conferences for the past few years even when I wasn't doing more Java development. Here's a pick of some I've gone to that are decent:

* [Devoxx](http://www.devoxx.com/) - Biggest edition is in Antwerp, although they now have in France and UK.
* [JAX](http://jaxconf.com/) - A long-running and large conference in Germany. From the same guys that run BASTA!
* [JavaZone](http://javazone.com) - It's like NDC but Java. A lot of talks in Norwegian though.
* [JavaOne](http://www.oracle.com/javaone/index.html) - The Big One. This is like the TechEd of the Java world.

There are also some 'cross-platform' conferences such as [QCon](http://qconlondon.com), [YOW!](http://yowconference.com.au), [GOTO](http://gotocon.com), etc.
