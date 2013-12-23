---
layout: post
title: Automating Testing with Mocha and WebStorm
categories:
- JetBrains
tags:
- mocha
- node.js
- Unit Testing
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704296;}
  _wpas_skip_twitter: '1'
  _elasticsearch_indexed_on: '2012-02-26 12:39:16'
---
<p align="justify">Today Paul Campbell asked on Twitter about the possibility of having an automated testing scenario using WebStorm and Mocha.</p>
<a href="http://hhariri.files.wordpress.com/2012/02/image44.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb44.png" alt="image" width="623" height="240" border="0" /></a>
<p align="justify">Although there’s nothing built in to <a href="http://www.jetbrains.com/webide">WebStorm</a> to support this, it’s actually very simple to setup. All we need are a few bits and pieces:</p>
<p align="justify">- <strong><a href="http://visionmedia.github.com/mocha/">Mocha</a></strong>. A testing framework for node.js. I’ve been using it for some time and it’s quite decent. It’s from the same guys that have brought us <a href="http://expressjs.com/">ExpressJS</a>. There are alternatives such as <a href="http://vowsjs.org/">Vows</a>, and much of what I explain here will work with others too.</p>
<p align="justify">- <strong><a href="https://github.com/remy/nodemon">Nodemon</a></strong>. This is a pretty sweet file monitor for node.js applications by Remy Sharp. Basically the way it works is that it wraps your node.js application and then sits monitoring a folder, where you source files are located. As soon as it detects a change, it re-launches your application.</p>

<h1>Getting it working on the command line</h1>
<p align="justify"><em>Note: All instructions I’m giving are for MacOSX. If you’re running node.js and WebStorm on Windows, the same things should apply except where explicitly indicated (although I’ve not tested it on Windows). </em></p>
<p align="justify">The first step is to make sure things are working on the command line. Mocha can be installed globally or locally. The instructions here are assuming a local install of mocha. For this, in your project folder type:</p>
<p align="justify"><a href="http://hhariri.files.wordpress.com/2012/02/image45.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb45.png" alt="image" width="312" height="19" border="0" /></a></p>
<p align="justify">Next step is to install nodemon. This one you can install globally</p>
<p align="left"><a href="http://hhariri.files.wordpress.com/2012/02/image54.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb54.png" alt="image" width="350" height="18" border="0" /></a></p>
If everything has installed correctly, you should now be able to run it

<a href="http://hhariri.files.wordpress.com/2012/02/image47.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb47.png" alt="image" width="618" height="180" border="0" /></a>

A few things to take into account:
<ul>
	<li>By default, nodemon is going to monitor the current folder, as such, we do not need to indicate the –w parameter.</li>
	<li>mocha automatically runs tests located in a folder called <em>test. </em>If you want to apply this to another folder or specific tests, then you can just pass them as a parameter after the <em>mocha</em>.</li>
</ul>
<div><em>[Update: As <a href="https://twitter.com/#!/GraemeF/status/173859328950939648">Graeme Foster pointed out</a>, an alternative is to use just mocha with the <strong>--watch</strong> parameter. However, at the time I tried it, it wasn't working, but seems the issue is resolved in the latest version. The nodemon alternative however should work with other testing frameworks that do not support monitoring inherently]</em></div>
<div>    </div>
<div>     </div>
<h1></h1>
<h1>Running under WebStorm</h1>
Once that’s running, the next step is setting it up in WebStorm to have all this in one place.

As I mentioned, WebStorm does not ship out of the box with this kind of functionality. However, what it does provide is great Command Line tool functionality. Under the <em>Tools </em>menu, there is a <em>Run Command… </em>which allows us to run any command and have the output displayed inside a tool window:

Here is the output of running <em>ls –la</em>

<a href="http://hhariri.files.wordpress.com/2012/02/image48.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb48.png" alt="image" width="649" height="303" border="0" /></a>

It’s pretty obvious what the next step is to run

<em>nodemon node_modules/mocha/bin/mocha</em>

and it should work, but it doesn’t. You’ll get the following error:

<strong>env: node: No such file or directoy</strong>

Reason for this is that when running GUI applications under MacOSX, the environment variables are not the same as those when you run a from a terminal. In particular, node for instance is not on the path. To overcome this issue, you can either launch WebStorm from the terminal (<em>yuck!</em>) or solve it. Fortunately this isn’t as hard as it once was. <a href="http://devnet.jetbrains.net/docs/DOC-1160">Here’s a Tip on our forum</a> for RubyMine but it applies to all IDE’s including WebStorm. In essence, its creating an <em>environment.plist </em>file inside <em>~/.MacOSX </em>which contains your full path. Mine is <a href="http://dl.dropbox.com/u/3569762/environment.plist">here if you want to download it</a>. Make sure you reboot your machine after doing this step.
<h1>Setting up an alias</h1>
Everything should be working now, but instead of having to type this in each time, lets set up an alias for it in WebStorm. Click on Preferences (CMD+, under MacOSX) and type in <em>Command </em>to get to the command line tools. Click on the + button to create a new entry and confirm the dialog box to create a new custom framework. Here are my entries:

<a href="http://hhariri.files.wordpress.com/2012/02/image49.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb49.png" alt="image" width="601" height="218" border="0" /></a>

We’re done. Only thing left to do is run it. Go back to <em>Tool | Run Command </em>and type <em>cmocha</em>

<a href="http://hhariri.files.wordpress.com/2012/02/image50.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb50.png" alt="image" width="732" height="276" border="0" /></a>

Now as soon as you make a change to the file and save it, you’ll instantly see if any tests have failed:

<a href="http://hhariri.files.wordpress.com/2012/02/image51.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb51.png" alt="image" width="681" height="247" border="0" /></a>

You can take it one step further and combine this with WebStorm auto-save features:

<a href="http://hhariri.files.wordpress.com/2012/02/image52.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb52.png" alt="image" width="513" height="354" border="0" /></a>

and now have your tests run constantly! Whenever you want to stop it, just click on the red square or merely close the tool window

<a href="http://hhariri.files.wordpress.com/2012/02/image53.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:4px 10px;" title="image" src="http://hhariri.files.wordpress.com/2012/02/image_thumb53.png" alt="image" width="535" height="177" border="0" /></a>

I’ve shown you how to do this with <em>mocha </em>but as I mentioned, it should work with other testing frameworks such as <em>vows</em>. You can also pass parameters to <em>mocha </em>to change the reporting style of the test output etc. but for purposes of continuous testing, none of that is really required. Simply seeing if everything has passed or the failing tests is sufficient.
