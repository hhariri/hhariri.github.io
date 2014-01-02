---
layout: post
title: Profiling NHibernate with NHProf
categories: []
tags:
- NHibernate
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-03-16 00:50:00'
comments: true
---
<p>
There&#039;s a common conception that developers suck at creating user interfaces. And it&#039;s probably right on target. One of the reasons is that, as developers, we look at things differently than a normal user would. And usually this causes problems, except in one scenario where it&#039;s an advantage: when our end users are of our own species. NHProf fits that bill perfectly.
</p>

<p>
Along with <a href="http://www.balsamiq.com/">Balsamiq</a>, which I <a href="/blogengine/post/2009/03/13/Balsamiq-Just-wow!.aspx">blogged about</a> a few days ago, <a href="http://nhprof.com">NHProf</a> is the other tool that I had a chance to play with this week, and I&#039;m pretty excited about it. For those of you who don&#039;t know what it is, NHProf is a profiler for NHibernate, created by <a href="http://ayende.com">Ayende</a>.
</p>

<p>
One of the characteristics of NHibernate is it&#039;s extensive logging support, and using log4net, NHibernate can log almost anything that happens. However, it&#039;s not always easy to read this information, let alone debug what&#039;s wrong.
</p>

<p>
NHProf tries to fix this shortcoming by offering a visual and extremely useful interface that provides relevant information you need to understand what&#039;s going on under the covers and help you improve performance of your application. And if that weren&#039;t enough, in a true fashion, inline with tools such as <a href="http://www.jetbrains.com/resharper">Resharper</a>, it even offers you tips and recommendations.
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/NHProfProfilingNHibernate_2DD/image_4.png"><img style="border-width:0;" src="/blogengine/image.axd?picture=WindowsLiveWriter/NHProfProfilingNHibernate_2DD/image_thumb_1.png" border="0" alt="image" width="553" height="297" /></a>
</p>

<p>
I&#039;ll be posting more about this tool as I play with it. It&#039;s really got me excited. It comes with a 30 day trial so make sure you check it out.&nbsp;
</p>
