---
layout: post
title: Cannot Launch Debugger error in ReSharper
categories: []
tags:
- ReSharper
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2010-02-16 10:31:25'
---
<p>&#160;</p>  <p>[Note: This blog post applies to the nightly builds for ReSharper 5 version 1616 and lower]</p>  <p>If you’re getting the “Cannot Launch Debugger” message when trying to debug Unit Tests with the <a href="http://www.jetbrains.com/resharper">ReSharper</a> runner, you’ll be happy to know it’s fixed. However, if you can’t wait until the next build, you can workaround by taking the following steps:</p>  <p>1. Locate the following files located in %Program Files%\JetBrains\ReSharper\v5.0\Bin\</p>  <ul>   <li>JetBrains.ReSharper.TaskRunner.CLR4.exe.config</li>    <li>JetBrains.ReSharper.TaskRunner.CLR4.MSIL.exe.config</li>    <li>JetBrains.ReSharper.TaskRunner.CLR4.x64.exe.config</li> </ul>  <p>2. Find the entry in each file:</p>  <p>&lt;startup&gt;   <br />&#160; &lt;requiredRuntime version=&quot;v4.0.21006&quot; /&gt;    <br />&lt;/startup&gt;</p>  <p>and change them to:</p>  <p>&lt;startup&gt;   <br />&#160; &lt;requiredRuntime version=&quot;v4.0&quot; /&gt;    <br />&lt;/startup&gt;</p>
