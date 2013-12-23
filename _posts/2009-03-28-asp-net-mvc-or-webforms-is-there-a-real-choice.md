---
layout: post
title: 'ASP.NET MVC or WebForms: Is there a real choice?'
categories: []
tags:
- ASP.NET MVC
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-03-28 19:35:00'
---
<p>
I&#039;ve been playing with ASP.NET MVC from the first preview that was released, and it&#039;s also very similar to a technology I used to use back in 1998, called WebBroker (part of Delphi). Point being, I&#039;m pretty comfortable with the MVC approach. I also have had the opportunity to do talks and workshops on ASP.NET MVC recently, and one of the questions that come up frequently is whether or not people should use ASP.NET MVC or stick with WebForms. Generally my answer is, if it&#039;s a new application, go with MVC. If it&#039;s an existing ASP.NET WebForms application, stick with it, <em>unless</em> it is causing maintenance nightmares, requires continuous work and expansion, then it might be worthwhile considering a port (read <em>rewrite</em>) to ASP.NET MVC.
</p>
<p>
In this post, I&#039;m not going to make a side-by-side comparison of ASP.NET Classic (from now on referred to as ASP.NET) and ASP.NET MVC (from now on referred to as MVC). I&#039;m going to concentrate on a few of the &quot;disadvantages&quot; that are normally associated with MVC and give you my thoughts on why I think they are not really a disadvantage.
</p>
<p>
&nbsp;
</p>
<p>
1. <strong>Step learning curve.      <br />
</strong>WebForms was pretty much born for WinForm developers to port their applications to the Web. The idea was to leverage the existing knowledge of developers and not have them learn a whole new set of concepts to make their application &quot;web-enabled&quot;. It worked around HTTP&#039;s stateless nature, hid concepts such as Javascript, HTML and CSS. In turn it added things like ViewState, the ASP.NET Page lifecycle, Server-Side all purpose controls, where a control had multiple responsibilities including rendering, handling postbacks, event management, etc.&nbsp; as well as unfriendly URL&#039;s, cryptic and in general bloated HTML output.
</p>
<p>
As such, one of the arguments against MVC that&#039;s usually made is that it has a steep learning curve, that you need to understand concepts such as HTML and Javascript. That is true, we&#039;re dealing with a thing called &quot;Web&quot; which is based on things such as HTML and Javascript and CSS, so it&#039;s not that far fetched. In addition, many ASP.NET veteran developers know that you can&#039;t get by any serious web application without ever having to touch Javascript. Having said that, the learning curve is not that steep, once you lose the webophobia.
</p>
<p>
&nbsp;
</p>
<p>
<strong>2. Lack of Server Side Controls.      <br />
</strong>In MVC there&#039;s no concept of server-side controls. The immediate reaction to this is that we lose the drag-and-drop grids, dropdowns, calendar pop-ups, etc. However, these server-side controls with amazing functionality aren&#039;t magic. A lot of the functionality is done via client-side Javascript. A couple of years ago, this could pose a problem. Today, with libraries such as jQuery it doesn&#039;t. You want a drop-down calendar on ALL your textboxes on the form, all you need to do is add one line:
</p>
<p>
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;input&quot;).datepicker();</strong>
</p>
<p>
It&#039;s not drag-and-drop, but then again, it&#039;s not that complicated either. The same goes for grids, auto-complete components, etc.. There&#039;s a whole community of controls (and most free).
</p>
<p>
&nbsp;
</p>
<p>
<strong>3. Lack of RAD Development      <br />
</strong>At my sessions, as I start showing people what MVC is about, I can see faces thinking <em>&quot;I have to now write all this by hand again&quot;</em> or <em>&quot;here comes the 90&#039;s all over again</em>&quot;. Yet, when during the same session 20 minutes later, I show them how you can put together a CRUD application in very short amount of time, you can see the sparkle in their eyes. The lack of RAD in MVC comes from the wrong assumption that since there aren&#039;t concepts such as ObjectDataSource or drag-n-drop controls, it&#039;s slower to create application.
</p>
<p>
MVC offers it&#039;s own solution to creating RAD application. To start with, there is a complex and extensible object binding under the hoods. This means that I can declare a method (action as it&#039;s known in MVC) that can take a complex type (with it&#039;s graph of subtypes) and have two-way binding out of the box.&nbsp; In terms of data, one of the advantages of the MVC framework is that it doesn&#039;t impose a specific model. You can use Web Services, Linq 2 Sql, NHibernate, whatever you want. You can even use Dynamic Data Services. Therefore the time it takes to consume a model is irrelevant of whether you use MVC or ASP.NET.
</p>
<p>
Out of the box scafolding, support for T4 templates jQuery add all the RAD&#039;ness without the disadvantages. You get to do RAD development, yet at the same time, maintain a clear separation of concerns.
</p>
<p>
&nbsp;
</p>
<p>
<strong>4. Losing some of the ASP.NET Framework      <br />
</strong>MVC is built on the ASP.NET framework. Therefore, things such as Membership, Master Pages, Session Management, Localization, Forms Authentication, etc. are all there. You don&#039;t lose any of that.
</p>
<p>
&nbsp;
</p>
<p>
<strong>5. Re-use of code      <br />
</strong>Many people have been creating ASP.NET Web applications using the MVP pattern. The main advantage that this gives, apart from the obvious separation of conerns, is that you are left with a Presenter that you can <em>ideally </em>re-use in both your Web application as well as your Desktop application. Although this might seem a good idea at first, in reality it probably means that you have let business logic leak into your Presenters, which is not a good thing. With MVC for example, the Controller&#039;s only concern should be to act as a bridge between the Model and the View. This normally is translated into 2-3 lines of code.
</p>
<p>
It should never make business decisions.
</p>
<p>
&nbsp;
</p>
<p>
<strong>Summary</strong>
</p>
<p>
The above are only some of the so-called disadvantages of using MVC. I&#039;ve not even talked about the advantages, being the post would be too long. However, here are a few highlights:
</p>
<ul>
	<li>Clean Separation of Concerns </li>
	<li>Complete Control and Clean HTML Output </li>
	<li>SEO Friendly URL&#039;s </li>
	<li>Test Friendly (even TDD) </li>
	<li>Clean Integration with Ajax (no need for Web Services, PageMethods or Page load hacks) </li>
	<li>Extensible and Customizable </li>
	<li>Support for multiple View Engines </li>
</ul>
<p>
There&#039;s one typical argument that I&#039;ve heard of wether you should use MVC or ASP.NET. They say that MVC is a good choice when you want to create testable and maintainable applications. Well, in my book, I ALWAYS want to do that so really it&#039;s not a valid argument.
</p>
<p>
To be entirely fair though, I do see one disadvantage with MVC: there&#039;s not enough hosting companies out there that support .NET 3.5. But it&#039;s just a matter of time...
</p>
