---
layout: post
title: Razor Intellisense and ReSharper
categories: []
tags:
- ASP.NET
- ASP.NET MVC
- ReSharper
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704326;}
  _elasticsearch_indexed_on: '2010-11-10 22:11:12'
comments: true
---
As many of you know, <a href="http://tv.jetbrains.net/videocontent/aspnet-features-in-resharper-5-part-1">ReSharper enhances the behavior</a> of ASP.NET and Visual Studio in general. Yesterday the ASP.NET team released ASP.NET MVC 3 Release Candidate. The release includes support for Intellisense and Syntax Highlighting for Razor View Engine. There is however an issue if you have ReSharper installed, as it currently does not support Razor. As much as we’d like to sim-ship support for Razor as it’s made available, this is not always possible. Nonetheless we are working hard to bring you Razor support for <a href="http://www.jetbrains.com/resharper">ReSharper</a>, along with first class support for JavaScript and CSS (all the goodness of Code Inspections, Refactoring, Intellisense and more). However, this does not mean that you cannot use ReSharper and Visual Studio’s default Razor Intellisense today. In this post I’ll show you how to do this.
<h4>Choosing the type of Intellisense</h4>
ReSharper has two options when it comes to Intellisense. You can either continue to use the default Visual Studio Intellisense or use the enhanced ReSharper Intellisense. This is something that can be configured under ReSharper –&gt; Options –&gt; Intellisense –&gt; General.

<a href="http://hhariri.files.wordpress.com/2010/11/snaghtml1f3c146e.png"><img style="display:inline;border-width:0;" title="SNAGHTML1f3c146e" src="http://hhariri.files.wordpress.com/2010/11/snaghtml1f3c146e_thumb.png" border="0" alt="SNAGHTML1f3c146e" width="458" height="458" /></a>

Since we currently do not support Razor what happens is that when inside a CSHTML file (Razor’s View Files), ReSharper doesn’t “understand” it and therefore does not automatically invoke Intellisense. However, you can work around this by manually invoking Intellisense. This is done by pressing <em>Ctrl+Space</em>:

<a href="http://hhariri.files.wordpress.com/2010/11/image3.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/11/image_thumb3.png" border="0" alt="image" width="520" height="206" /></a>

Using this option, you continue to get the benefits of ReSharper enhanced Intellisense inside Visual Studio, and have default Visual Studio Intellisense inside Razor files. However, you do need to manually invoke it.

If you are not comfortable with this option, you can revert back to using Visual Studio’s Intellisense. All you need to do is select this option under the configuration displayed previous. This will then automatically invoke Intellisense for Razor files without the need to press Ctrl+Space. You can then manually invoke ReSharper Intellisense with <em>Ctrl+Alt+Space</em>

<a href="http://hhariri.files.wordpress.com/2010/11/image4.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/11/image_thumb4.png" border="0" alt="image" width="530" height="210" /></a>
<h4>Default Editor</h4>
If Intellisense still does not work for you despite these two workarounds, make sure you have not associated the CSHTML files with an incorrect editor. Prior to RC of MVC 3, many users have been using HTML Editor as the default editor for CSHTML, which enabled them to get basic HTML Intellisense and Syntax highlighting. If you still have this option set, make sure you set it to use the new Razor Editor. To do this, right click on any CSHTML file and click on <strong>Open With</strong>, choosing <strong>Razor Editor</strong>

<a href="http://hhariri.files.wordpress.com/2010/11/image5.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/11/image_thumb5.png" border="0" alt="image" width="401" height="168" /></a>

<a href="http://hhariri.files.wordpress.com/2010/11/snaghtml1f47de61.png"><img style="display:inline;border-width:0;" title="SNAGHTML1f47de61" src="http://hhariri.files.wordpress.com/2010/11/snaghtml1f47de61_thumb.png" border="0" alt="SNAGHTML1f47de61" width="406" height="267" /></a>

Doing this should enable Intellisense inside Razor for you, and you continue to get the full benefits of ReSharper outside of Razor.

If you continue to have any issues with Intellisense, please leave a comment or contact us via the forums, <a href="http://www.jetbrains.com/facebook">Facebook</a> or <a href="http://twitter.com/resharper">Twitter</a>.  And don’t forget you can learn more about ReSharper and our other tools at <a href="http://tv.jetbrains.com">JetBrainsTV</a>
