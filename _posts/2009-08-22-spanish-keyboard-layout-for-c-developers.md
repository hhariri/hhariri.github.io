---
layout: post
title: Spanish Keyboard layout for C# Developers
categories: []
tags:
- Hardware
status: publish
type: post
published: true
meta:
  tagazine-media: a:7:{s:7:"primary";s:0:"";s:6:"images";a:0:{}s:6:"videos";a:0:{}s:11:"image_count";s:1:"0";s:6:"author";s:7:"5078411";s:7:"blog_id";s:8:"11677451";s:9:"mod_stamp";s:19:"2010-11-05
    10:04:34";}
  _elasticsearch_indexed_on: '2009-08-22 14:55:32'
comments: true
---
<p>&#160;</p>  <p>I use a Spanish Keyboard which is kind of a nuisance when developing in C#. It’s mainly due to the key layout for curly braces. Every time you need curly braces, you have to press AltGr (Ctrl+Alt) along with another key. Other annoying keys are the semicolon and the square brackets. </p>  <p><a href="http://en.wikipedia.org/wiki/File:KB_Spanish.svg"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image" border="0" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/KeyboardlayoutforCDevelopers/22666226/image.png" width="588" height="199" /></a> </p>  <p><font size="2">(Image licensed under the </font><a href="http://en.wikipedia.org/wiki/Creative_Commons"><font size="2">Creative Commons</font></a><font size="2"> </font><a href="http://creativecommons.org/licenses/by-sa/3.0/"><font size="2">Attribution ShareAlike 3.0</font></a><font size="2">, obtained from Wikimedia Commons)</font></p>  <p>So after years of frustration, I finally decided to call it a day. Today I ran into the <a href="http://www.microsoft.com/downloads/details.aspx?familyid=FB7B3DCD-D4C1-4943-9C74-D8DF57EF19D7&amp;displaylang=en">Microsoft Keyboard Layout Creator</a> which allows you to create custom keyboard layouts. It’s pretty simple to use and extremely flexible since it allows you define dead keys also (which was part of the my problem when attempting to do it manually using the Scancode Maps). You can change key mappings or define a whole new keyboard layout from scratch. </p>  <p>My new mapping is based on the original Spanish layout, switching the key combinations required for curly braces and square brackets. Instead of getting a tilde by default, you now get braces and brackets. If you want the original characters, you need to use AltGr. I’ve switched the semicolon and comma around also. You no longer need to use shift to obtain a semicolon. I’ll see how it works out, although I must admit while writing this post, every time I’ve wanted to insert a comma, I’ve ended up with a ; </p>  <p>The tool creates a convenient executable so that you can install the new mapping on any machine without a lot of fuss. I’m including both the executables (x86, 64bit, etc.) along with the project file to this post. Feel free to use it or adjust it to your own needs. <a href="http://hadihariri.com/Downloads/CSharpLayout.zip">Get it here</a></p>
