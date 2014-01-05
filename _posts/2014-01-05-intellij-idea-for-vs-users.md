---
layout: post
title: IntelliJ IDEA for Visual Studio Users
status: published
type: post
published: true
comments: true
---

**Last updated:** 05 January, 2014

* Test
{:toc}

## Why this Guide

Much like its counterpart, [the JVM Guide]({% post_url 2013-12-29-jvm-minimal-survival-guide-for-the-dotnet-developer %} the purpose of this guide is to make it easier for those using Visual Studio to get up to speed faster with
IntelliJ IDEA.

### Work in progress

While it is a blog post, it is also a page that I will update as and when I come across new things. At the top is the latest updated date.

### Target Audience

Although the title says "for Visual Studio Users", this guide is also is helpful for those new to IntelliJ IDEA. Reason there's a reference to Visual Studio is because there
are quite a few comparisons to it.

## The Basics

IntelliJ IDEA is a full-fledged IDE with all the things you'd come to expect from one including:

* Intellisense and Code Completion
* Coding Helpers
* Code Analysis
* Navigation
* Refactoring
* Debugging
* Source Control Integration
* Unit Testing and Code Coverage
* Code Formatting
* Build Management
* Continuous Integration support
* Other Tooling and Features

### Two Editions

IntelliJ IDEA comes in two flavors:

* Community Edition - Free and OSS
* Ultimate Edition - Commercial product.

Ultimate builds on top of Community Edition, adding some features. See [full comparison](http://www.jetbrains.com/idea/features/editions_comparison_matrix.html).

### Android Studio versus IntelliJ IDEA

Android Studio is a Google product that is built on top of IntelliJ IDEA Community Edition. It is also free and OSS but is maintained by Google, not JetBrains.

### WebStorm, PyCharm, RubyMine, PhpStorm, AppCode or IntelliJ IDEA?

JetBrains provides specialized IDE's which are more focused around a specific language and/or technology. These are:

* WebStorm: For JavaScript and general Web
* PyCharm: Python, Django, etc.
* RubyMine: Ruby and Rails
* PhpStorm: PHP
* AppCode: Objective-C

All of them are based on the same platform: IntelliJ IDEA Platform. If you are doing JVM Development, you need IntelliJ IDEA. Otherwise pick the IDE that's most appropriate for you.
All the functionality included in each of these individual IDE's (with the exception of AppCode), are also available in IntellIJ IDEA. However, the release cycles may vary so while
you won't necessarily get it out of the box at the same time, you will find it as a [plugin](http://plugins.jetbrains.com)

### Cross Platform

IntelliJ IDEA is cross-platform. It run on Java, which means you can run it on Windows, OSX and Linux. You can use either Oracle's JVM distribution or OpenJDK (a warning comes up but in general it should work fine).

### Multiple Languages and Technologies

IntelliJ IDEA is not just a Java IDE, where Java refers to Java the language. There are dozens of plugins for multiple languages including Clojure, Scala, Kotlin, Go, HTML, JavaScript, etc. Some of these plugins are
developed by JetBrains, others by the community.

You can use IntelliJ IDEA to develop even web applications that are built using HTML and JavaScript and have nothing to do with Java. Although in these cases, it's recommended that you use WebStorm (if you don't need JVM technology).

In addition to languages, it supports an array of technologies and frameworks such as Spring, Android, Java EE, et al.

### Extensible

A lot of the features in IntelliJ IDEA are plugins. Some are bundled, others can be downloaded from the [plugin repository](http://plugins.jetbrains.com). There are over 1000 plugins available.

You can also build your [own plugins for IntelliJ IDEA](http://confluence.jetbrains.com/display/IDEADEV/PluginDevelopment).

## Projects

When working with IntelliJ IDEA you have various options on how you want to deal with projects. You can use IntelliJ IDEA's own format or use Maven/Gradle projects.

### IntelliJ IDEA Projects

#### Modules and Libraries

An IntelliJ Project is similar to a Visual Studio Solution and can consist of modules and libraries:

* **Module**: A discrete unit of functionality that can be compiled, debugged, tested independently. Think of them as Projects in Visual Studio. Configuration information for
a module is stored in a file with extensions *.iml*. Each module inside the project has its own *.iml* file.
* **Libraries**: An archive of compiled code (i.e. JAR) that a module can depend on.

A single IntellIJ project can consist one or more modules and/or libraries.

#### Storage Format

IntelliJ Projects can be persisted in two ways:

* **Project File** (Legacy): Project information is stored in a file with extension *.ipr*.
* **Directory Based** (Recommended): Project information is stored in a folder called .idea in the main root of the project folder.

More information about [projects and storage formats](http://www.jetbrains.com/idea/webhelp/project.html)

### Maven Projects

IntelliJ IDEA can also work with Maven modules. You can either import existing Maven modules or create a new one.

### Gradle Projects

IntelliJ IDEA can also work with Gradle projects. Much like Maven, you can also create a new one or import an existing one.

### Files to check-in to Version Control

When working with Version Control, you should check in all files in the project folder, including the .idea folder (when using directory based approach), except for
the *workspace.xml* and *tasks.xml* files. [See Serge's explanation for more information](https://intellij-support.jetbrains.com/entries/23393067)

## Creating a new Project

1. Click on **File \| New Project**

2. Select the type of module. The most basic one is *Java*, independently of the language you're going to use. Remember, IntelliJ IDEA is multi-language so in eseence you can have multiple
languages in the same module. The other options are technology specific. So for instance, Android will create an Android application, Spring will create a Spring application, et al.

    ![New Project]({{ site.images }}/idea-guide-1.png)

3. Select the SDK. Usually you'd pick a JDK here (or Android SDK). This is equivalent to selecting the target .NET framework in Visual Studio. If you don't have anything
available in the dropdown, it's because you don't have a JDK IntelliJ IDEA knows about. Click New and add one, which means: point to the installation folder of the JDK. You can also add
other types of SDK's such as Android or IntelliJ IDEA Plugin SDK.

4. On clicking *Next*, you have the chance to pick the technologies you want included in the module. This means ultimately adding library references or support for specific languages.
For instance, when working with Kotlin, I pick Kotlin at this stage (albeit IntelliJ IDEA can also detect new Kotlin files and add support automatically). You can pick things like
Java EE support, Heroku Development, etc.

    ![Pick Technologies]({{ site.images }}/idea-guide-2.png)

5. Click Finish. You should now end up with a new Project and module

    ![New Project and Module]({{ site.images }}/idea-guide-3.png)

### Adding new Modules to existing projects

If you want to add a second module (think C#/VB project) to the project:

1. Click on **File \| New Module**

2. Repeat steps 2 to 5 from [Creating a new Project](#creating-a-new-project)

### Project Settings



## Working with Maven Projects

## Working with Gradle Projects

## Sharing Projects with Eclipse

## Working with Project Dependencies

## Working with Artifacts

## Keybindings

Just remember Shift+Ctrl+A

### Schemes

### Most important shortcuts

## Building Projects

### Compile, Make or Rebuild

## Running Applications

### Run Configurations

## Debugging Applications

## Working with Tests

### Running Tests

### Debugging Tests

### Code Coverage

### Integrating with TeamCity

## Completion

### Intellisense

### Documentation

### Parameter Info

## Navigation

## Code Analysis

## Refactoring

## Version Control

### Local History

## Tools

### Terminal

### REST Client

### File Comparisons

### Database Tools

## Plugins

## Change Log

Tracks changes made to this guide.

| Date | Change |
|------|--------|
| | |