---
layout: post
title: MSTest Not Executed Error
categories: []
tags:
- Design
- Unit Testing
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-07-08 10:53:00'
---
<p>I&#039;m testing out a new IoC container framework (more on that later), and so I decided to setup some tests to see how it works. As a &quot;newbie&quot; to MSTest (MbUnit / xUnit rules!), I wrote my tests, tried to run them and was presented with an error message:   <br />Failed to queue test run &#039;Hadi Hariri 2008-07-08 10:06:31&#039;: Test Run deployment issue: The location of the file or directory &#039;d:\.....\someAssembly.dll&#039; is not trusted.     <br />Now D is my local drive, so go figure why suddenly an assembly I reference on my local disk is not trusted. Wel lit turns out that Vista, in all it&#039;s glory (I have a love-hate relationship with Vista, I love hating it all the time), decided to block this assembly and all other files I extracted from a zip file I downloaded.     <br />So if it happens to you, go to the assembly and unblock it. And of course, this is not something you can do by selecting multiple files at once. No, that would be WAY too dangerous! You need to do it one by one. Alternatively, delete the whole folder, unblock the zip file and then extract it.</p>
