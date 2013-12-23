---
layout: post
title: With HTTP, your application is your API
categories:
- General
tags:
- ASP.NET MVC
- Design
status: publish
type: post
published: true
meta:
  tagazine-media: a:7:{s:7:"primary";s:0:"";s:6:"images";a:0:{}s:6:"videos";a:0:{}s:11:"image_count";s:1:"0";s:6:"author";s:7:"5078411";s:7:"blog_id";s:8:"11677451";s:9:"mod_stamp";s:19:"2012-04-05
    22:37:43";}
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1386313009;}
  _elasticsearch_indexed_on: '2012-04-05 22:37:43'
---
As of ASP.NET MVC 4.0, the once-named WCF WebAPI project is now part of MVC. To provide a quick summary for those not familiar with either of the two:
<ul>
	<li>ASP.NET MVC is a framework that allows you to create applications based on HTTP.</li>
	<li>WebAPI is a framework that allows you to create applications based on HTTP.</li>
</ul>
So now, under one roof (the roof being ASP.NET MVC not ASP.NET which would have made a bit more sense) you can use two distinct technologies to create HTTP-based applications. Note that I'm talking about HTTP, not necessarily what one would call RESTful systems, but plain HTTP.
<h1>Two choices, what to do?</h1>
Which one to choose from though? Well, the problem with that question (or maybe a somewhat answer) is that neither of the two technologies is complete. Each have their own missing features and benefits.

With ASP.NET MVC, out of the box, you don't get things like Content Negotiation, Support for Conditional GETs or PUTs, Complete HTTP Response codes, HTTP Authentication, among other things. And in case you're wanting to take a resource approach, well you're out of luck there too since MVC is focused around operations not resources. You do get nice support for View Engines though.

On the other hand, with WebAPI, you do get some of the previous things, mainly Content Negotiation and a more Resource orientated approach (or so it has been said). You also get self-hosting capabilities and are more "exposed" to the raw HTTP. But, you don't get a View Engine. What this means is that you can't easily throw together some template in Razor and have it display to in a browser as a user interface.
<h1>The Microsoft Guidance</h1>
The general guidance coming out of Microsoft, be it from blog posts, tutorials or generally what members of the ASP.NET team are recommending, is to use the best of both worlds. That is, use MVC to create your user interface and use WebAPI to create your API. You can have a <em>CustomerController </em>to handle the HTML views and interaction with real humans, and have an <em>CustomerAPIController </em>(or whatever is may be called) to deal with non-human software interacting with your system. There are wizards in the product to create the different types of controllers and the main debate going on seems to focus more around what folder each type of controller should reside in. It is also mostly being defended under the Separation of Concerns Act.

To be clear, it is recommended to:
<ul>
	<li>Create your user interface with MVC</li>
	<li>Create your API with WebAPI</li>
</ul>
<h1>There is no division</h1>
When you're creating an application based on HTTP, your application protocol, that is the language that is used to communicate between your application and the consumer of your application is HTTP. HTTP is not a mere conduit to transfer information. It is a fully fledged application protocol.  It has operations, it has request headers, it has responses and response code. It knows how to deal with stale data, it knows how to deal with authentication. It knows what resources are and how to represent these in different way. It is your API.

If you take this into account, your User Interface, is nothing more than another consumer of your API. When you request to see a Customer, if you are a human being, you will be presented with an HTML page to see the customer record. When you are a machine you can request a JSON or XML variant of that customer. However, these are merely two different representations of the same thing. When you update  a customer, be it via a user inputing data into a form, or a machine submitting a POST request, there should be no distinction in the behavior of your application. Why would there by? And if there isn't, why add an extra overhead of separating them out? It makes no sense whatsoever to try and artificially separate these two concepts out into UI and an API. The only UI thing you need to do on the server is forms and HTML pages. Not separate controllers.
Well there are two potential reasons you might want to do this:
<ul>
	<li>Political, to somehow justify having two ways to implement the same thing</li>
	<li>Technical. Shortcomings of one technology prohibiting you from doing it</li>
</ul>
But neither of those stand. The political reason here should be irrelevant to you as a consumer of the ASP.NET MVC stack. More importantly however, the technical reason should not distort the reality.
<h1>So what should you do?</h1>
Personally I am against drawing this artificial non-existing line between the two concepts merely to justify technical shortcomings. The solution I would take is to have one API and use one of the two technologies, or if you're open to alternatives, use those (OpenRasta, Nancy, FubuMVC), whatever,  I don't care which one you use.

I have been using MVC for some years and the missing pieces such as content negotiation, HTTP authentication, ETag support (conditional requests), are nothing but a bunch of filters that are implemented with a few lines of code. Moving from operations to resources is nothing but a few routing techniques, implemented using some conventions (if you're interested I have a lot of code I can share).

Whatever you do use though, don't let its shortcoming dictate your design. You are implementing HTTP systems, embrace HTTP.
