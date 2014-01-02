---
layout: post
title: Dealing with the "Too many dependencies" problem
categories:
- General
tags:
- Architecture
- Design
status: publish
type: post
published: true
meta:
  _wpas_skip_twitter: '1'
  _wpas_skip_fb: '1'
  tagazine-media: a:7:{s:7:"primary";s:53:"http://hhariri.files.wordpress.com/2012/04/image4.png";s:6:"images";a:1:{s:53:"http://hhariri.files.wordpress.com/2012/04/image4.png";a:6:{s:8:"file_url";s:53:"http://hhariri.files.wordpress.com/2012/04/image4.png";s:5:"width";s:3:"519";s:6:"height";s:3:"470";s:4:"type";s:5:"image";s:4:"area";s:6:"243930";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"1";s:6:"author";s:7:"5078411";s:7:"blog_id";s:8:"11677451";s:9:"mod_stamp";s:19:"2012-04-10
    06:17:43";}
  _elasticsearch_indexed_on: '2012-04-09 16:53:33'
  twitter_cards_summary_img_size: a:6:{i:0;i:519;i:1;i:470;i:2;i:3;i:3;s:24:"width="519"
    height="470"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
comments: true
---
Earlier <a href="http://hadihariri.com/2012/04/09/too-many-dependencies/">I asked</a> whether people thought the issue of passing in too many dependencies into a class was an actual problem. This was in response to another post I did about <a href="http://hadihariri.com/2012/04/07/test-setups-and-design-smells/">test smells</a>. A few people had asked me how the problem of a controller having way too many dependencies should be solved. My <a href="https://twitter.com/#!/hhariri/status/188730907115528194">response</a> to <a href="https://twitter.com/#!/hhariri/status/188705084971028480">them</a> was to apply Single Responsibility Principle, which is pretty much <a href="http://hadihariri.com/2012/04/09/too-many-dependencies/#comments">what others also said</a>.
<h3>The problem</h3>
Here is the problem:

<img title="Controller" src="{{ site.images }}/dtmd-1.png" alt="" width="519" height="470" />

In this case it is a controller, but it can well be any other type of class.
<h3>Dependency Injection does not solve tight coupling</h3>
Why is this a problem? After all, we are applying Dependency Injection.

We are, but we are not decoupling classes. All we are doing is allowing a specific implementation to be swapped out easily. Whether we're doing it because we want to change behaviors in tests or at runtime, all we're doing is avoiding depending on a specific implementation.

What we are not doing is automagically making our code clean and sustainable.

The more dependencies our class takes in, the higher its efferent coupling to other classes, meaning that it knows a little bit too much. If it knows too much, it is  most likely because it is also doing too much. The class is no longer focused on one thing, and as a consequence we are creating somewhat brittle software that is too tightly coupled, even if we are passing in our dependencies, even if we are not using <em>new</em> anymore.
<h3>How did we get here?</h3>
We all agree that DI is good and so is Composition over Inheritance. And this causes us to end up with classes that act as coordinators or require information or perform actions on these different classes. Other times we end up here because of:
<h2>Framework impositions</h2>
Often, frameworks impose restrictions that take us down the wrong path. Such is the case of ASP.NET MVC when using the default routing conventions. We mostly encapsulate functionality under a specific controller because the routing suites us. In other words, from a user's perspective it makes sense to have many things under the <strong>/checkout/<em>{action}</em></strong> path, even if that leads us to bloated controllers<em> </em>that take many dependencies which have little to do with each other.
<div>
<h2>Badly named classes</h2>
<em>XYZService</em> or <em>XYZManager</em> named classes are yet another example of ending up with too many dependencies. When we start to encapsulate everything under a <em>service </em>or <em>manager</em>, we find that despite some of the dependencies only being used by one or two methods, still have to be passed in.
<h2>IoC Containers</h2>
As developers we no longer worry about wiring up all the different required dependencies as Containers now do this for us. This allows us to inject and inject and inject.
<h3>Helping solve the problem</h3>
First and foremost, and despite it being beaten to death, we need to apply Single Responsibility Principle. <a href="http://hadihariri.com/2010/12/18/srp-as-easy-as-123/">I've written in the past</a> techniques that have often helped me accomplish this. Taking this into account, there's also a series of Do's and Don'ts that can help:
<h1>What you can do</h1>
<ul>
	<li><strong>Work around framework limitations</strong>. For instance, in the case of ASP.NET MVC, you can override the routing behavior to not tie you down to using one class just because you need to keep the same URL. This can be done in various ways. Google <em>Controllerless Actions</em> for some examples (just a starting point).</li>
	<li><strong>Create small focused classes</strong>. Why create a <em>CustomerServices<strong> </strong></em>that takes in five dependencies as opposed to creating <em>MakeCustomerPreferredCommand </em>and <em>InvalidateCustomerCommand</em> class that takes one dependency and has a single method to do what is required?</li>
	<li><strong>Extract infrastructure</strong>. Don't pass in dependencies that have to do with infrastructure, specially if these are repetitive. Use techniques such as AOP to apply these at the level where they belong.</li>
	<li><strong>Think about Patterns</strong>. Often patterns can help solve the problem of too many dependencies. For instance, many times, what's deemed as a large collaborative class can instead be turned into a series of classes using the Chain of Responsibility pattern.</li>
	<li><strong>Events. </strong>Event driven architecture is a great way to provide higher decoupling and independence between objects.</li>
	<li><strong>CQRS</strong>. Well I just had to mention this one because it's fashionable. In all seriousness though, this also allows for lower of dependencies since it separates responsibilities into smaller commands and separate queries, which again is our goal.</li>
</ul>
<h1>What you shouldn't do</h1>
<ul>
	<li><strong>You shouldn't switch to using Service Locator</strong> as opposed to Dependency Injection. All you're doing is hiding the problem. Dependency Injection is actually beneficial in that it is showing us that we are breaking SRP and have a high coupling.</li>
	<li><strong>You shouldn't stop using an IoC Container</strong>. There are other ways to prevent the  Inject Happy Developer. Testing your code is one of them. As you write tests, you'll suffer the pain of having to set things up over and over again (and refrain from encapsulating that).</li>
</ul>
These are just some simple guidelines. They are not set in stone.
<h3>Injection Happy Detector</h3>
Finally, while writing the initial post, I came up with an idea of writing a ReSharper plugin that could help detect classes that have too many dependencies. The result is
the <a href="https://github.com/hhariri/ReSharperPlugins">InjectionHappy Detector</a>. Once installed, it gives you a warning if it finds a constructor taking in too many interfaces. This number by default is 3 (just some random value, you can change it yourself under Options). It's a very simple plugin and not full-proof. More of an experiment. You're free to fork it and enhance it anyway you wish.

</div>
