---
layout: post
title: Import all in IntelliJ IDEA
status: published
type: post
published: true
comments: true
---
Last week I ran into [Kevlin](https://twitter.com/KevlinHenney) at [JavaZone'14](http://2014.javazone.no), and we were chatting about a presentation he'd just given, titled
[Making Steaks from Sacred Cows](https://vimeo.com/105758303), which I highly recommend you watch.


In it, he discusses amongst other things, the habit of importing classes individually in the Java world. As someone that does C# development also, I find it kind of bizarre:

<br/>
![Individual Imports]({{ site.images}}/import-all-1.png)
<br/>
<br/>
In .NET, we just import the namespace
<br/>
<br/>
```c#
using System.Collections
```
<br/>
<br/>

Like many things we do out of habit, these usually stem from somewhere, and I'm certain that we mostly know the reasons for individual imports in Java, including
namespace collision, et al. Personally, I don't agree with the reasons, and Kevlin does a great job analysing this particular case in his talk, so I don't want to repeat it here.

<br/>
However there is one thing that does stands out in terms of the answers he found:


    "Well the IDE handles it for me"


    "Any good IDE should hide the imports for you"



<br/>
Of course, those aren't answers of why we do it, they are just excuses. It pointed out nicely the exact issue Kevlin was trying to make: questioning why it is we do certain things.
In other words, not caring because a tool does it for us is not an answer.

<br/>

It also got me wondering, whether I could change this behaviour. And it is possible, at least
in IntelliJ IDEA.

<br/>

## Changing import behaviour


Under **Preferences \| Code Style \| Java**, we can define how we want importing packages to work


<br/>
![Import Settings]({{ site.images}}/import-all-2.png)

<br/>
<br/>
Un-checking the "Use Single Class import" will make IntelliJ IDEA use a single import statement. Alternatively, we can also define this behaviour based on the number of imported types using
the class count, which is set to 5 by default. By
setting it to 1 we can instruct IntelliJ IDEA to always import everything. Setting it to 2 will have it switch to all one the second entry, and so on and so forth.


<br/>
In addition, I found that we can also customise this behaviour depending on the actual package we're importing (as shown in the box lower down in the image).


<br/>
Unfortunately, for those of us working mostly with Kotlin as opposed to Java, this feature isn't available yet, but [hopefully one day it will be](http://youtrack.jetbrains.com/issue/KT-5782)



