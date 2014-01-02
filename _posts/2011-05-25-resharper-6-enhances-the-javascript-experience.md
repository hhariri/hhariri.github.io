---
layout: post
title: ReSharper 6 enhances the JavaScript experience
categories:
- JetBrains
tags:
- ReSharper
- ReSharper 6
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704309;}
  _elasticsearch_indexed_on: '2011-05-25 12:15:02'
comments: true
---
We <a href="http://blogs.jetbrains.com/dotnet/2010/12/resharper-6-eap-is-open-details-on-javascript-support/">already mentioned</a> some of the benefits that ReSharper brings to the table when it comes to JavaScript development previously. In this post we are going to have a more in-depth look at some of the features.
<h2>Pimping jQuery</h2>
In addition to <a href="http://blogs.jetbrains.com/dotnet/2010/12/resharper-6-eap-is-open-details-on-javascript-support/">support for JavaScript</a>, <a href="http://www.jetbrains.com/resharper">ReSharper</a> 6 also provides certain functionality specific to <a href="http://jquery.com">jQuery</a>.
<h3></h3>
<h3>Code Completion for Selectors</h3>
When working with jQuery selectors we often need to lookup certain DOM elements or CSS classes in order to operate with them. This can result in a back-and-forth between the code we are working on and looking up of a specific element. ReSharper 6 facilitates these cumbersome operations by providing code completion for selectors:

<a href="http://hhariri.files.wordpress.com/2011/05/image3.png"><img style="padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb2.png" alt="image" width="381" height="187" border="0" /></a>

This completion is invoked by typing # between the quotes, where as if we were to type ., we’d get:

<a href="http://hhariri.files.wordpress.com/2011/05/image4.png"><img style="padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb3.png" alt="image" width="423" height="231" border="0" /></a>

This completion is available anywhere we a selector is required.  Of course if we merely want to select a specific type of element, we also have completion:

<a href="http://hhariri.files.wordpress.com/2011/05/image5.png"><img style="padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb4.png" alt="image" width="502" height="218" border="0" /></a>
<h3>Extending jQuery extensions</h3>
One of the benefits of jQuery is the ease by which we can extend it to add our own functions and methods. ReSharper enhances this experience by providing completion also for custom extensions. For instance, if we were to write a new extension:

<a href="http://hhariri.files.wordpress.com/2011/05/image6.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb5.png" alt="image" width="287" height="117" border="0" /></a>

we now have <strong>myFoo </strong>available as a method of jQuery:

<a href="http://hhariri.files.wordpress.com/2011/05/image7.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb6.png" alt="image" width="222" height="62" border="0" /></a>

Much in the same way, if we want to extend an object:

<a href="http://hhariri.files.wordpress.com/2011/05/image8.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb7.png" alt="image" width="262" height="128" border="0" /></a>

we have:

<a href="http://hhariri.files.wordpress.com/2011/05/image9.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb8.png" alt="image" width="463" height="167" border="0" /></a>
<h2>Importing File References</h2>
Out of the box, Visual Studio requires a special comment to be added to script files to provide support for IntelliSense:

<a href="http://hhariri.files.wordpress.com/2011/05/image10.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb9.png" alt="image" width="566" height="70" border="0" /></a>

With ReSharper this is not required. If however, it is included, ReSharper will then limit the scope of Intellisense to the reference added. This reference can be provided by directly typing it in, in which case ReSharper offer completion:

<a href="http://hhariri.files.wordpress.com/2011/05/image11.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb10.png" alt="image" width="495" height="212" border="0" /></a>

as well as providing quick-fixes when errors are detected in paths:

<a href="http://hhariri.files.wordpress.com/2011/05/image12.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb11.png" alt="image" width="466" height="138" border="0" /></a>
<h2>Creating from Usage</h2>
Similar to C# and VB.NET, we can now also create JavaScript code based on usage. For instance, let’s say we write some code that calls a specific function named <em>getInterval </em>that does not yet exist. ReSharper prompts us to create a local function:

<a href="http://hhariri.files.wordpress.com/2011/05/image13.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb12.png" alt="image" width="511" height="171" border="0" /></a>

generating the code for us, providing us the same ability we have in C# to iterate through parameter names etc. The same applies to variables:

<a href="http://hhariri.files.wordpress.com/2011/05/image14.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb13.png" alt="image" width="478" height="139" border="0" /></a>

as it does to <strong>creating parameters </strong>and <strong>properties</strong>; once again, making the whole development experience a bit smoother.

Last but not least, ReSharper also provides the ability to create <strong>jQuery extension methods</strong> from usage:

<a href="http://hhariri.files.wordpress.com/2011/05/image15.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb14.png" alt="image" width="564" height="53" border="0" /></a>
<h2>Refactoring</h2>
Certain refactoring operations are now available in JavaScript. Firstly, in combination with <strong>Create from Usage</strong>, we can now easily add an extra parameter to a function call and have ReSharper offer to create it for us:

<a href="http://hhariri.files.wordpress.com/2011/05/image16.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb15.png" alt="image" width="443" height="149" border="0" /></a>

<strong>Introduce Variable </strong>is another refactoring option available:

<a href="http://hhariri.files.wordpress.com/2011/05/image17.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb16.png" alt="image" width="322" height="122" border="0" /></a>

And last but not least, R<strong>enaming</strong>:

<a href="http://hhariri.files.wordpress.com/2011/05/image18.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb17.png" alt="image" width="648" height="268" border="0" /></a>

ReSharper is smart enough to handle the scope of the renaming outside of the current local scope, prompting you always with the option to fine-tune certain renaming's.
<h2>Code Clean-up and Rearranging.</h2>
In a <a href="http://blogs.jetbrains.com/dotnet/2010/12/resharper-6-eap-is-open-details-on-javascript-support/">previous blog post</a> we mentioned briefly the code formatting options for JavaScript. These have now been extended and better organized. We can fine tune <strong>Lines Breaks</strong>, <strong>Braces Layout</strong> as well as <strong>Space </strong>via <strong>ReSharper</strong> | <strong>Options</strong> | <strong>JavaScript</strong> | <strong>Formatting</strong> <strong>Style</strong>. Below are the options for the newly added <strong>Spaces:</strong>

<a href="http://hhariri.files.wordpress.com/2011/05/image19.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb18.png" alt="image" width="471" height="505" border="0" /></a>

Running code-cleanup on JavaScript files is of course now also possible:

<a href="http://hhariri.files.wordpress.com/2011/05/image20.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb19.png" alt="image" width="453" height="61" border="0" /></a>

Also, out of the box, we provide certain filters, both in clean-up and analysis, such as those with <strong>min.* </strong>extensions. These can be changed in the options dialog, albeit it’s not highly recommended.

<a href="http://hhariri.files.wordpress.com/2011/05/image21.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb20.png" alt="image" width="223" height="265" border="0" /></a>

<strong>Rearranging Code</strong>

You can now rearrange code which includes moving parameters around, moving members up/down as well as arguments and object literals and arrays. All this is done using the same key combination as used in C# and VB.NET (<strong>Ctrl+Alt+Shift + Cursor Keys</strong>).
<h2>Code Inspections</h2>
JavaScript is a dynamic language. It has great advantages but can prove to be not the easiest language to work with, specially for novices. We’ve tried to ease some of that pain by providing code inspections, where possible. Among the many code inspections that currently are available are:

<strong>Syntax errors</strong>

<a href="http://hhariri.files.wordpress.com/2011/05/image22.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb21.png" alt="image" width="344" height="62" border="0" /></a>

<strong>Unused symbols</strong>

<a href="http://hhariri.files.wordpress.com/2011/05/image23.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb22.png" alt="image" width="297" height="67" border="0" /></a>

<strong>Dead code</strong>

<a href="http://hhariri.files.wordpress.com/2011/05/image24.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb23.png" alt="image" width="228" height="140" border="0" /></a>

<strong>Duplicate switch statements</strong>

<a href="http://hhariri.files.wordpress.com/2011/05/image25.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb24.png" alt="image" width="242" height="209" border="0" /></a>

<strong>Misuse of “this”</strong>

<a href="http://hhariri.files.wordpress.com/2011/05/image26.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb25.png" alt="image" width="513" height="227" border="0" /></a>

<strong>Accessing undefined global symbols</strong>

<a href="http://hhariri.files.wordpress.com/2011/05/image27.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb26.png" alt="image" width="448" height="104" border="0" /></a>

And this is just a few of the over 25 inspections that ReSharper supports along with their corresponding quick fixes. We believe that this will help remove some of the issues encountered at runtime, specially by newcomers.
<h2>Miscellaneous</h2>
Some of the other features provided for JavaScript are:
<ul>
	<li><strong>Configurable Naming Conventions: </strong>Much like C# and VB.NET you can define your own naming conventions.</li>
</ul>
<a href="http://hhariri.files.wordpress.com/2011/05/image28.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb27.png" alt="image" width="280" height="179" border="0" /></a>
<ul>
	<li><strong>Comments: </strong>Ability to comment and uncomment blocks of code as well as support for XML Documents.</li>
	<li><strong>Context Actions Settings</strong>: You can fine-tune which of context actions you want enabled.</li>
</ul>
<a href="http://hhariri.files.wordpress.com/2011/05/image29.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2011/05/image_thumb28.png" alt="image" width="361" height="184" border="0" /></a>
<ul>
	<li><strong>Live Templates:</strong>  Support for Live Templates</li>
	<li><strong>Navigation and Find Usages: </strong>Navigation support as well as <strong>Find Usages </strong>for JavaScript members, some of which was already covered in a <a href="http://blogs.jetbrains.com/dotnet/2010/12/resharper-6-eap-is-open-details-on-javascript-support/">previous post</a>.</li>
	<li><strong>Coding Assistance:</strong> Also covered in <a href="http://blogs.jetbrains.com/dotnet/2010/12/resharper-6-eap-is-open-details-on-javascript-support/">previous post</a>.</li>
</ul>
All in all, we hope that some of these features allow JavaScript to become a language to that easier to learn, use and enjoyable.

ReSharper 6 is currently in EAP. <a href="http://jetbrains.net/resharper">Download it today</a> and start playing with it. We’d love to hear your feedback.
