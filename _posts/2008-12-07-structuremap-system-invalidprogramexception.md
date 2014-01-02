---
layout: post
title: StructureMap System.InvalidProgramException
categories: []
tags:
- IoC
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1364993458;}
  _elasticsearch_indexed_on: '2008-12-07 16:24:00'
comments: true
---
<p>
I just upgraded to the latest release of StructureMap (2.5) and spent a good portion of time trying to figure out a bug I was having in a complex dependency graph. The original exception is a StructureMap exception, with code 207, which per documentation, you need to look at the inner exception. The problem is that the inner exception isn&#039;t awfully helpful:
</p>
<p>
&nbsp;
</p>
<blockquote>
	<p>
	<strong>System.InvalidProgramException : JIT Compiler encountered an internal limitation.        <br />
	</strong>
	</p>
</blockquote>
<p>
Initially I thought it was related to the <em>WithCtorArg</em> method that allows you to pass in parameters to the constructor, but after stripping everything down to try and come up with a test case, it seems that the issue occurs when you have a class that the container resolves which has a <strong>public static</strong> property, like so:
</p>
<div style="border:1px solid gray;overflow:auto;font-size:8pt;width:97.66%;cursor:text;max-height:200px;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;height:248px;background-color:#f4f4f4;margin:20px 0 10px;padding:4px;">
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">interface</span> ISomeClass
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">void</span> SomeMethod();
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span> }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> SomeClass : ISomeClass
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span> {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">static</span> <span style="color:#0000ff;">int</span> SomeProperty { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> SomeMethod()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>     {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>     }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  16:</span> }
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
Here&#039;s the StructureMap configuration test:
</p>
<div style="border:1px solid gray;overflow:auto;font-size:8pt;width:97.5%;cursor:text;max-height:200px;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;margin:20px 0 10px;padding:4px;">
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> [Fact]
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> TestStructureMap()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span> {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>     ObjectFactory.Initialize( x =&gt; x.ForRequestedType&lt;ISomeClass&gt;().TheDefault.Is.OfConcreteType&lt;SomeClass&gt;());
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>     ObjectFactory.GetInstance&lt;ISomeClass&gt;();
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span> }
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
As soon as you make the property private or make it an instance property, the container resolves fine. I tested the same thing with Unity and there doesn&#039;t seem to be an issue.
</p>
<p>
I tested the same code with 2.4.9 and it seems to work.&nbsp;
</p>
