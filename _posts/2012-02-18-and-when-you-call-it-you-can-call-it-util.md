---
layout: post
title: And when you call it, you can call it Util
categories:
- General
tags: []
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1387048789;}
  _wp_old_slug: and-when-you-call-me-you-can-call-me-util
  _wpas_skip_twitter: '1'
  _elasticsearch_indexed_on: '2012-02-18 22:21:35'
---
No. Actually you can't call it Util*. You might think I'm a pain in the backside, nitpicking on issues like naming. I'm not.

<em>Util</em>, short for <em>Utility </em>is something useful. And it would probably be really useful if I could find it. But that's the problem. You don't always find it. When you're working on a foreign codebase, things aren't always as obvious as they seem. The only real thing that you can go by is the hope that other developers named things in sensible ways. Because otherwise you're lost.

In fact, you're not only lost, but you might even end up duplicating efforts, you know, you might end up writing that wretched helper method and put it in a class called <em>FormatHelper </em>as opposed to <em>FormatUtil</em>. And when Jack comes along, well he'll just write his own and place it in <em>FormatServices. </em>Why? Cause the first time, we didn't care too much about the name.

The only thing that I should rely on, the only thing I should be dependent on to understand the code, is the code. I shouldn't have to bug a teammate to find out how something works or what a parameter means, or whether some routine exists or I should create it myself. We should leverage the language we all communicate in and understand and name things coherently.

Next time you're figuring out what you should name a class, name it as what it does. And if you think that it does too much to describe it eloquently, then you'll solve two problems in one go.

That's why I'm so picky about naming. Because, despite what you think, it is not obvious until its obvious. And for you, the author, its always obvious. For me, it's not.

* Util, Service, Helper, Manager, ....all of these are pretty much worthless...
