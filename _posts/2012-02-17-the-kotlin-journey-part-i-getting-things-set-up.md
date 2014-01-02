---
layout: post
title: 'The Kotlin Journey Part I : Getting things set up'
categories:
- JetBrains
tags:
- Kotlin
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704297;}
  _wpas_skip_twitter: '1'
  _wpas_skip_fb: '1'
  _oembed_f97ea99349ec27772e00ddaced82271b: '{{unknown}}'
  _oembed_85e4fe1afb16fc1eb1ef51312574ecd3: '{{unknown}}'
  _elasticsearch_indexed_on: '2012-02-17 07:59:07'
  twitter_cards_summary_img_size: a:6:{i:0;i:72;i:1;i:65;i:2;i:3;i:3;s:22:"width="72"
    height="65"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
comments: true
---
This is a multi-part series on Kotlin, a new statically typed language from JetBrains targeting the JVM and JavaScript

<a href="http://hadihariri.com/2012/02/17/the-kotlin-journey-part-i-getting-things-set-up/">Part I: Getting things set up</a>
<a href="http://hadihariri.com/2012/03/10/the-kotlin-journey-part-ii-a-premier-on-classes/">Part II: A primer on classes</a>
<a href="http://hadihariri.com/2012/07/21/the-kotlin-journeypart-iii-wrapping-up-classes/">Part III: Wrapping up classes</a>
<a href="http://hadihariri.com/2012/09/27/the-kotlin-journey-part-iv-adding-functionality" target="_blank">Part IV: Adding functionality</a>

For the past year or so, a team of developers at JetBrains, lead by <a href="http://twitter.com/abreslav">Andrey Breslav</a> have been working on a new language codenamed Kotlin, a statically-typed language targeting the JVM and JavaScript. Kotlin is a multi-purpose language and can be used for pretty much any type of development.

As someone interested in languages, I’ve taken it upon myself to learn more about Kotlin and offering you to join me in the journey. If like me, most of your time in the past few years has been spent as a C# developer, not a Java one, then we’re pretty much in the same space. So you’ll feel right at home.
<h1>A little about Kotlin</h1>
<img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-1.png" alt="image" width="72" height="65" border="0" />

Kotlin has been developed in an attempt to improve the way we work. It has removed some of the bad things Java has and added some nice features that Scala provides. It is an Object Orientated language, not a functional one, although it does have higher-order functions and function literals. If you are interested in the reasons as to why Kotlin has been developed, check out some of the entries in the <a href="http://confluence.jetbrains.net/display/Kotlin/FAQ">FAQ</a>. There is also <a href="http://blog.jetbrains.com/kotlin/2011/08/why-jetbrains-needs-kotlin/">this post</a> that is worth checking out about why JetBrains needs Kotlin.

Another important fact about Kotlin is that it is OSS, both the compiler and the IntelliJ IDEA plugin. Taking into account that we also provide an <a href="http://www.jetbrains.com/idea/free_java_ide.html">IntelliJ Community Open Source edition</a>, the tooling costs for using Kotlin is zero.
<h1>Setting up IntelliJ to work with Kotlin</h1>
Several days ago we announced the <a href="http://blog.jetbrains.com/kotlin/2012/02/kotlin-goes-open-source-2">general availability of the EAP for Kotlin</a>.The entire source code for Kotlin is <a href="https://github.com/JetBrains/Kotlin">available on our GitHub account</a>. There is also a <a href="https://github.com/downloads/JetBrains/kotlin/kotlin-0.1.429.zip">build of the compiler</a> available as a zip. That’s pretty much all you need to work with Kotlin. However, to make the experience much nicer, we’re going to work inside of IntelliJ and use the Kotlin plugin already available for it.
<h2></h2>
So the first step is to download IntelliJ. I’m working with the Ultimate Edition, but you can use the Community Edition if you like. Note however that the plugin DOES NOT WORK with IntelliJ 11 or prior versions. It is only supported in IntelliJ 11.1 EAP which you can download from <a href="http://confluence.jetbrains.com/display/IDEADEV/IDEA+11.1+EAP">here</a>. I’m using build 114.98. The codename for this EAP is <em>Nika</em> and the executable is named <em>Nika</em> too so make sure you run the correct instance of IntelliJ if you have 11.0 or a prior version installed. Even though the plugin might load in previous editions, it won’t work correctly.

Once IntelliJ is installed, next step is to install the plugin. Download it <a href="https://github.com/downloads/JetBrains/kotlin/kotlin-plugin-0.1.1358.zip">from here</a> and then click on Preferences inside IntelliJ and type ‘Plugin’ in the search box to get quick access to the list of Plugins.

<a href="http://hhariri.files.wordpress.com/2012/02/image24.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-2.png" alt="image" width="765" height="446" border="0" /></a>

On the right panel, click on <em>Install plugin from disk </em>and select the zip file downloaded.

<a href="http://hhariri.files.wordpress.com/2012/02/image25.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-3.png" alt="image" width="426" height="648" border="0" /></a>

Once complete, you should now see the Kotlin plugin installed

<a href="http://hhariri.files.wordpress.com/2012/02/image26.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-4.png" alt="image" width="560" height="171" border="0" /></a>

You will have to restart the IDE.
<h1>Creating the first Hello World project</h1>
Now that the plugin is installed, we can create a new project. Kotlin does not currently have its own project type. Kotlin is merely a language. You can use it in any type of Java Application. In fact, Kotlin can interoperate with Java so pretty much all the JVM is at our disposable. What we’re going to do, is create a new Java  Project. I’m going to assume zero knowledge of how to create a project in IntelliJ so we’ll go through the steps.

1. Click on <em>File</em> | <em>New Project</em>. Select <em>Create project from scratch</em> and hit <em>Next</em>

<a href="http://hhariri.files.wordpress.com/2012/02/image27.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-5.png" alt="image" width="873" height="312" border="0" /></a>

2. Type in name for the project (<em>KotlinHelloWorld</em>). Leave all the options intact and click <em>Next</em>

<a href="http://hhariri.files.wordpress.com/2012/02/image28.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-6.png" alt="image" width="876" height="368" border="0" /></a>

3. On the source folder, leave the default <em>src </em>and click <em>Next.</em>What this does is define the source folder where our source code files will be kept.

<a href="http://hhariri.files.wordpress.com/2012/02/image29.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.image }}/kj1-7.png" alt="image" width="881" height="309" border="0" /></a>

4. In the dialog box to select technologies to use, for now leave blank and hit <em>Finish</em>.

<a href="http://hhariri.files.wordpress.com/2012/02/image30.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.image }}/kj1-8.png" alt="image" width="878" height="316" border="0" /></a>

Note: If this is the first time you’re running IntelliJ you might be prompted to select the JDK folder to use. IntelliJ normally located this folder and you merely have to confirm it.

If everything went OK, your Project structure should look like this:

<a href="http://hhariri.files.wordpress.com/2012/02/image31.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-9.png" alt="image" width="367" height="312" border="0" /></a>
<h2>Sidetrack: ReSharper keymapping</h2>
Before continuing, and in an attemp to feal more comfortable in IDEA, I recommend installing my ReSharper key mappings. If you’re a ReSharper user, you will feel right at home since pretty much all of the key bindings are the same. In IntelliJ, to import key mappings, select <em>File | Import Settings </em>and point to a jar file which can contain key mappings as well as any other IntelliJ settings. You can find my key mappings at <a title="https://github.com/hhariri/Tidbits/blob/master/resharper.jar" href="https://github.com/hhariri/Tidbits/blob/master/resharper.jar">https://github.com/hhariri/Tidbits/blob/master/resharper.jar</a>. You can change the key mapping any time you want using <em>Preferences </em>and typing in ‘keymap’ for quick access to the configuration entry:

<a href="http://hhariri.files.wordpress.com/2012/02/image32.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-10.png" alt="image" width="263" height="334" border="0" /></a>
<h1>Creating the first Kotlin file</h1>
Once we have the project created, next step is to add a Kotlin file. To do this, right click in the Project explorer while your mouse is on the <em>src </em>folder to get the menu up:

<a href="http://hhariri.files.wordpress.com/2012/02/image33.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-11.png" alt="image" width="563" height="204" border="0" /></a>

and select <em>Kotlin File</em>

Give the file a name

<a href="http://hhariri.files.wordpress.com/2012/02/image34.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-12.png" alt="image" width="196" height="109" border="0" /></a>

You should now have an empty file with a toolbar at the top asking you to install the Kotlin runtime. If you do not have this, make sure you haven’t installed or launched the wrong version of IntelliJ.

<a href="http://hhariri.files.wordpress.com/2012/02/image35.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-13.png" alt="image" width="790" height="203" border="0" /></a>

Click on the <em>Setup Kotlin Runtime. </em>What this does is install a series of required libraries for Kotlin in the project. You project structure should now look like this

<a href="http://hhariri.files.wordpress.com/2012/02/image36.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-14.png" alt="image" width="341" height="264" border="0" /></a>
<h1>Write some code</h1>
Inside the <em>HelloWorld.kt </em>file, type <em>fun</em>:

<a href="http://hhariri.files.wordpress.com/2012/02/image37.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-15.png" alt="image" width="396" height="157" border="0" /></a>

If the installation is correct, you should get help from the IDE to complete the statement. This is pretty much like ReSharper Live Templates. You can hit Tab at this point and get the function template for Kotlin. <em>fun </em>in Kotlin represents a function, which can return a type or void

<a href="http://hhariri.files.wordpress.com/2012/02/image38.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-16.png" alt="image" width="328" height="131" border="0" /></a>

Give the function a name, no params and leave the return type blank. In the body type out <em>println(“Kotlin: First Contact”). </em>End result should be:

<a href="http://hhariri.files.wordpress.com/2012/02/image39.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-17.png" alt="image" width="330" height="108" border="0" /></a>

In this post, I’m not going to delve into the languages details as such. The objective is to get the environment up and running to make sure it all works and then later dive into the different aspects of the code. However a couple of things worth mentioning:
<ul>
	<li>In Kotlin, a function/procedure starts with the word <em>fun </em>and can return a type or <em>Unit</em> (void), making it either a function (if it does) or a procedure (if it doesn’t). As such, writing <strong>fun foo()</strong> and <strong><em>fun foo(): Unit</em></strong> are exactly the same thing. We'll dive more into what <em>Unit</em> is in a future post. For those familiar with languages such as Pascal, we had <em>function </em>and <em>procedure </em>to distinguish the two.</li>
	<li>Statements in Kotlin do not need to be terminated with semi-colon</li>
</ul>
Once we have the code typed in, it’s now time to compile it and see if it works. To compile, we can right click and select <em>Compile </em>or press Ctrl+F7.
<h1>Making it work</h1>
If no mistakes were made, the code should have compiled correctly. However, we can’t do much with it at this point, i.e. we cannot run it. Much like C#, Java and other programming languages, Kotlin requires an entry point in order to know where a program starts. And much like these languages, the entry point is a function called <em>main </em>that takes an array of strings as an argument. As such, let’s rename our function and give it some arguments:

<a href="http://hhariri.files.wordpress.com/2012/02/image40.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-18.png" alt="image" width="340" height="96" border="0" /></a>
<ul>
	<li>Arguments (although not present in this example) follow the Pascal style, which is <em>argumentName: argumentType</em>.</li>
</ul>
<div>Note: There is also a <em>main </em>template that expands into the previous function to make things easier.</div>
Now we have the ability to run the code. Right click and select <em>Run Namespace </em>or alternatively press Ctrl+F9.

<a href="http://hhariri.files.wordpress.com/2012/02/image41.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-19.png" alt="image" width="323" height="541" border="0" /></a>

This will automatically create a new Run configuration in IntelliJ called ‘namespace’, which we’ll look into later. What it does mean is that once we’ve run it the first time, the Run and Debug icons are now activated

<a href="http://hhariri.files.wordpress.com/2012/02/image42.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-20.png" alt="image" width="373" height="97" border="0" /></a>

If all has gone well, we can now see the output in the <em>Run </em>window:

<a href="http://hhariri.files.wordpress.com/2012/02/image43.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="{{ site.images }}/kj1-21.png" alt="image" width="448" height="152" border="0" /></a>
<h1>Summary</h1>
In this first part, we’ve gone through the basics to get Kotlin installed and our environment working to start writing code. We’ve only superficially touched one aspect of the language. We’ll dive deeper into these aspects in successive posts. Until then, you now have an environment to play around with Kotlin. Make sure you check out the <a href="http://confluence.jetbrains.net/display/Kotlin/Welcome">documentation here</a> if you want to learn more.
