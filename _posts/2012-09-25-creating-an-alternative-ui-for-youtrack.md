---
layout: post
title: Creating an alternative UI for YouTrack
categories:
- JetBrains
tags:
- YouTrack
status: publish
type: post
published: true
meta:
  draftfeedback_requests: a:1:{s:13:"50615b8f7aea5";a:3:{s:3:"key";s:13:"50615b8f7aea5";s:4:"time";s:10:"1348557711";s:7:"user_id";s:7:"5078411";}}
  draft_feedback: a:1:{s:13:"50615b8f7aea5";a:1:{i:0;a:2:{s:4:"time";s:10:"1348565811";s:7:"content";s:62:"http://youtrack.jetbrains.com/issue/EVAN-278#comment=27-384456";}}}
  _elasticsearch_indexed_on: '2012-09-25 07:19:40'
---
Customers often ask us whether submitting issues in YouTrack is complicated, in the sense that if it requires many fields to be filled in. Need being of course, that many QA departments don’t want to spend too much time filling out field after field of information to submit a bug.

The answer is of course, no, it’s not complicated at all. In fact, YouTrack is flexible enough that not only can you limit to very few the number of fields required (namely three), but you can also easily create your own user interface to submit defects. And not only that, but you can actually replace the entire UI of YouTrack. All this is made possible because of the powerful HTTP API it has. Let’s see how it’s done.
<h3>Embedding a <em>submit issue </em>form on your web site</h3>
What we want is this:

<a href="http://hhariri.files.wordpress.com/2012/09/image.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2012/09/image_thumb.png" alt="image" width="457" height="390" border="0" /></a>

In order to get there, we need to:
<ol>
	<li>Create the HTML page.</li>
	<li>Enable the REST API and Access from external sites.</li>
</ol>
<h1>Creating the HTML Page</h1>
<p align="left">The page itself is straightforward, being just a form with three elements. We’re using Twitter Bootstrap to give it somewhat of a nice design (which coincides now with 90% of the Internet). The only interesting thing on the page is two JavaScript functions. One obtains a list of projects from our YouTrack server, and the other creates a new issue.</p>
<a href="http://hhariri.files.wordpress.com/2012/09/image1.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2012/09/image_thumb1.png" alt="image" width="493" height="327" border="0" /></a>

The second function, <em>createIssue</em> which actually creates the issue would be:

<a href="http://hhariri.files.wordpress.com/2012/09/image2.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2012/09/image_thumb2.png" alt="image" width="497" height="360" border="0" /></a>

Only remaining thing would be to load the projects on page load:

<a href="http://hhariri.files.wordpress.com/2012/09/image3.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2012/09/image_thumb3.png" alt="image" width="502" height="108" border="0" /></a>

Although for this example we’re using JavaScript, if you prefer to use some other language such as <a href="http://github.com/JetBrains/YouTrackSharp">C#</a>, <a href="https://github.com/JetBrains/youtrack-rest-ruby-library">Ruby</a>, <a href="https://github.com/JetBrains/youtrack-rest-python-library">Python</a>, know that there are already libraries available. There’s even a <a href="http://kotlin.jetbrains.com">Kotlin</a> one in the <a href="https://github.com/evgeny-goldin/rest-clients">works</a>.
<h2>Enable REST API and Access from external sites.</h2>
To get this to work, we need to enable external access  to the API. For that, when logging in as Administrator in YouTrack, under the <em>Adminsitration</em>, <em>REST API</em>, we can specify whether we want external sites to have access to the API (<a href="http://en.wikipedia.org/wiki/Cross-origin_resource_sharing">CORS</a>). For this example, we’re going to allow access from all sites, although we can limit it to specific domains

<a href="http://hhariri.files.wordpress.com/2012/09/image4.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2012/09/image_thumb4.png" alt="image" width="511" height="174" border="0" /></a>

We can now easily embed a form to create issues in any web site. Obviously in this case, we have permissions enabled to let anyone submit issues but that can also be restricted by requiring a valid login beforehand.

You can try the <a href="http://pastehtml.com/view/cct5tlt4e.html">page live from here</a>. <a href="https://github.com/vadimgurov/youtrack-cors-samples">Download the source code for this here</a>.
<h3>Re-inventing the UI</h3>
Submitting issues isn’t the only thing that can be done using the YouTrack API. In fact, we can create a completely new User Interface for listing or displaying issues.

Recognize the screen below? Of course you don’t. It’s an alternative interface written by  <a href="https://twitter.com/alexeypegov">Alexey Pegov</a>, as a proof of concept, to demonstrate the full potential of the API.

<a href="http://hhariri.files.wordpress.com/2012/09/clip_image002.gif"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="clip_image002" src="http://hhariri.files.wordpress.com/2012/09/clip_image002_thumb.gif" alt="clip_image002" width="800" height="418" border="0" /></a>

What’s awesome about this UI, is that it’s nothing more than a façade over our own instance of YouTrack. All it is doing is providing a new look and feel for static data generated from YouTrack.

You can <a href="http://youtrack-slide.appspot.com/">try it live here</a> and explore the source code, experiment and adapt it to your own needs. <a href="https://github.com/JetBrains/youtrack-slide">Just fork it</a>.
<h3>Maximum flexibility</h3>
If we combine the ability to provide a custom user interface for submitting new issues, with the <a href="http://blogs.jetbrains.com/youtrack/2012/02/spicing-up-youtrack-with-workflows/">potential that the Workflow Editor provides us</a>, the possibilities are endless. We can completely automate the process of handling new submissions, such as automatically assigning an defect to a person based on the type of issue, create notifications, send emails (because we all need more emails in our lives) and a whole slew of other actions that can be performed with custom workflows.

And of course, having the ability to perform pretty much any type of operation with YouTrack, via the API provides us with the power to create custom user interfaces for different departments or users of our organization, removing unnecessary noise where it makes sense, and providing more information for only those that need it.

Have a play with it. I can assure you that you’ll be impressed.
