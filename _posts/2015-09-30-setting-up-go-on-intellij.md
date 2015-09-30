---
layout: post
title: Setting up Go on IntelliJ IDEA
status: published
type: post
published: true
comments: true
---

I've recently started playing with Go for some TCP code I'm working on. Once I got my *Hello World* up and running, the next obvious step of course was to try and
get IntelliJ IDEA running with it. And to my surprise it was pretty simple, but I did encounter a few things worth mentioning.


<br/>
Disclaimer: I'm completely new to Go, so if you spot any mistakes, please let me know.

## Installing Go

First and foremost you need to install Go. The easiest way I found was to just download the [installer package](https://golang.org/dl/) from the WebSite and click my way through it. 
I downloaded and installed version 1.5, after unsuccessfully messing around with 1.3 installed via brew.

<br/>
Before configuring IntelliJ IDEA, it's good to make sure Go is properly working. The [instructions on the Go site](https://golang.org/doc/install) are
pretty straightforward. Make sure the *hello.go* program runs correctly.

## A word on workspaces and GOPATH

Go likes to organize things under a work directory which has the following tree structure
<br/>
<p>-bin</p>
<p>-pkg</p>
<p>-src</p>
<p>&nbsp;&nbsp;&nbsp;-github.com</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-hhariri</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-project1</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-project2</p>

<br/>
The GOPATH environment variable points to the root folder of where you want this structure. In my case this was

        ~/projects/go


<br/>
Apparently, and someone please correct me if I'm wrong, you should kind of keep within this structure with Go, i.e. don't go placing your projects in different folders all over your hard-drive.

<br/>
Also, for things to work correctly, make sure that the GOPATH is on your system path. The installer creates a symbolic link to the Go executable under /usr/local/bin/go. 


<br/>
Learn more about [workspaces](https://golang.org/doc/code.html#Workspaces).

## Setting up IntelliJ IDEA

There is an [open source plugin](https://github.com/go-lang-plugin-org/go-lang-idea-plugin) Go plugin for IntelliJ IDEA, and in the recent year or so, two of my colleagues, in particular [Alexander Zolotov](https://github.com/zolotov)
and [Sergey Ignatov](https://github.com/ignatov) are proactively contributing to it.


<br/>
The [instructions to install the plugin](https://github.com/go-lang-plugin-org/go-lang-idea-plugin) on the project page are pretty clear. Simply add a new repository (choose between nightly or alpha) and you can then install it.


### Creating a new project

The plugin provides an entry in the Project Wizard which allows you to select any frameworks and libraries

<br/>
![Project Wizard]({{ site.images }}/go-project-wizard.png)

<br/>
You can of course now create new Go files and run and debug them straight from the IDE

<br/>
![Context menu]({{ site.images }}/go-context-menu.png)

If opening an existing project, IntelliJ IDEA should automatically detect it as a Go project and prompt you for any further action if required, i.e. just follow the instructions. It's simple!

### Build and Make Project

Build and Make Project have no effect in Go, even though the options are available. In Go, you pretty much need to run the code using the context menu or hotkeys (Shift+Ctrl+R for Run and Shift+Ctrl+D for Debug).

<br/>
IntelliJ IDEA does however provide error highlighting which makes it extremely useful, especially when you're new to the language!

### Installing Go apps

When running the command

        go install hello.go

compiles the source file and places the binary in the *bin* folder under GOPATH, which then allows you to simply call the app. Currently, unless you run this from the terminal tool window
 inside IntelliJ IDEA or configure it as an external tool, there's no corresponding action to do this for you. And I'm not really sure it's required as such either.

### Debugging

The most recent builds of the plugin provide support for debugging out of the box using [Delve](https://github.com/derekparker/delve), so there's no more need to set up GDB and go through the entire process of creating code certificates to sign it, etc. (which also works but quite tedious).

<br/>
![Context menu]({{ site.images }}/go-debug.png)


<br/>
Important to note though that you need *version 1.5+* of Go for it to work. Also, the plugin is not fully compatible with IntelliJ IDEA 15, which is currently in EAP. While many of the features do work, debugging does not. So if you're missing
the context menu to debug your app, that's why.


### Formatting code on the fly

IntelliJ IDEA provides code formatting and you can of course invoke it at any time using (on OSX 10.5+ keybinding) Alt+Cmd+L. However, if you want to use GoFmt, and have IntelliJ IDEA automatically format your code
on save, take a look at [Jame's post](http://jen20.com/2015/09/14/gofmt-or-goimports-in-intellij.html) on how to accomplish this with File Watchers.


