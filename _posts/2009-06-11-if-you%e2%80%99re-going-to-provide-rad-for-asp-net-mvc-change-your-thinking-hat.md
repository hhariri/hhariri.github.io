---
layout: post
title: If you’re going to provide RAD for ASP.NET MVC, change your thinking hat
categories: []
tags:
- Architecture
- ASP.NET MVC
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-06-11 17:32:00'
comments: true
---
<p>
ASP.NET MVC is not new. Ignoring the pattern for a moment, the way things work dates back to the days of CGI&rsquo;s and ISAPI&rsquo;s, where you had to role out pretty much everything by hand. You would get your data, format it and send it back to the browser, producing HTML. It wasn&rsquo;t easy, but you did have one advantage. You had full control.
</p>

<p>
&nbsp;
</p>

<p>
Gradually, tools starting to emerge to bring some sort of &ldquo;RADness&rdquo; to this kind of development. I in particular, used a technology called WebBroker from Delphi; we had Actions, PageProducers (replaced tags at runtime in an HTML template) and our data. Same concept as ASP.NET MVC, same concept as MonoRail, and other frameworks. Despite still having to do a lot of things manually, it did prevent us from having to write repetitive and tedious code in many cases.
</p>

<p>
&nbsp;
</p>

<p>
Up to then, you had one requisite to develop web applications: <strong>you had to understand the web and the technology behind it.</strong>
</p>

<p>
&nbsp;
</p>

<p>
Traditional ASP.NET or ASP.NET WebForms came around, among other things, to solve this problem: allow the non-web developer to leverage their existing knowledge to port their applications to the web. This meant not having to know much about web technology and at the same time. ASP.NET WebForms provided a <em>powerful</em> approach to web development: the concept of drag-n-drop that existed in WinForm applications. You could now take a control, drag it across to a form, set some properties and away you go: in minutes you had a web interface without having to even know what HTML meant.
</p>

<p>
&nbsp;
</p>

<p>
Now, I&rsquo;m no fan of ASP.NET WebForms. Actually that&rsquo;s not entirely true. I hate it, but I still admit that for some it has it&rsquo;s attractiveness and has solved problems for many people and put food on the table for many developers. So it has it&rsquo;s place and will continue to live on.
</p>

<p>
&nbsp;
</p>

<p>
I&rsquo;m also not alone. There are others like me that don&rsquo;t like ASP.NET WebForms. As such, when ASP.NET MVC came out, it gave us another technology, based on the ASP.NET stack, to&nbsp; develop web applications.&nbsp; Ignoring many of the differences and advantages it has over traditional ASP.NET, above all, it gave us control. As I always say, it put the <strong>web </strong>back into <strong>web development</strong>.
</p>

<p>
&nbsp;
</p>

<p>
As developers started to embrace this technology, questions started to arise about what kind of support there would be in terms of controls. Naturally, third party component vendors, those same ones that were providing support for traditional ASP.NET components, were being asked about this too. All those that I spoke to pretty much said the same thing, let&rsquo;s wait and see. And it&rsquo;s completely the right approach. There&rsquo;s no point in investing a large amount of time and resources into supporting a new framework if you don&rsquo;t know what the success of the framework will be, both in adoption, as well as commitment from the company behind it, in this case Microsoft.
</p>

<p>
&nbsp;
</p>

<p>
Now that ASP.NET MVC has been released, and there is a growing number of developers moving over from traditional ASP.NET, some companies are starting to develop a limited number of controls for ASP.NET MVC. I&rsquo;m guessing that some of these companies are dipping their feet into the MVC waters to see what kind of success their components might have, before taking the big plunge.
</p>

<p>
&nbsp;
</p>

<p>
I&rsquo;ve examined a few of these components. I&rsquo;m not going to mention any names or give an examples, but suffice to say, that up to now, I don&rsquo;t like what I see. And the reason is simple. Most of them are taking the wrong approach. They are thinking with their WebForms hat on. However, since there is no visual designer, they are using an immense amount of markup with custom tags to define their components. And many are mixing data, behavior and appearance in these markups. The problem with this approach is that it&rsquo;s going down the same route that many ASP.NET MVC developers left behind from by moving away from traditional WebForms: rich-intelligent-know-it-all controls. I&rsquo;m not going to show any code since I don&rsquo;t want to single-out any specific control/company, but sample applications for many of these exist and you&rsquo;re free to examine them for yourself.
</p>

<p>
&nbsp;
</p>

<p>
To summarize, trying to bring the same RAD controls that exist in WebForms over to ASP.NET MVC might not necessarily be correct thing to do. This is a different way to doing web development, a different mentality. And in my humble opinion, I think that this might backfire, since MVC developers mostly will not be too keen on this type of solution, the adoption rate for the components will be low and the component vendors behind them will throw in the towel.
</p>

<p>
&nbsp;
</p>
