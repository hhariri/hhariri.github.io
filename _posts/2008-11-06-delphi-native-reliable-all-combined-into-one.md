---
layout: post
title: Delphi, Native, Reliable, all combined into one
categories: []
tags:
- delphi
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-11-06 18:11:00'
comments: true
---
<p>
Sometime ago I <a href="/blogengine/post/2008/09/30/Native-applications.aspx">posted an entry</a> about some comments Michael Swindell had made about how Delphi was a better choice for enterprises because of it&#039;s speed. <a href="http://blog.marcocantu.com">Marco</a> followed-up to that <a href="http://blog.marcocantu.com/blog/delphi_native_code.html">post</a> with another one yesterday about how really .NET vs Win32 speed is not relevant, but what is relevant is being able to upgrade your application to the latest compiler, that same application written in Delphi 2.
</p>

<p>
I was going to comment on his blog, but since it turned out long, I&#039;ve made it a blog post. Now here&#039;s the thing. My original blog post wasn&#039;t about Delphi vs Visual Studio/C#/VB or CodeGear vs Microsoft. My point was that it&#039;s not all about performance. It might matter for intensive calculations and processing, but in general, it is not the case for the vast majority of Enterprise (or non-Enterprise for that matter) applications, specially when the real bottleneck is the database back-end and/or network.
</p>

<p>
Now Marco&#039;s post has somehow hooked into stability and reliability. These are broad terms which can be applied to many different aspects of an application and it&#039;s lifecycle. More than the actual scalability and up-time of the system, I think Marco&#039;s post is mostly referring to backwards compatibility.
</p>

<p>
One of the other points he brings up is how certain technologies have been dropped or are not backwards compatible. As for things being dropped, I think it&#039;s fair to say all companies do it. Even CodeGear has done it. Should I forget all the investment my company made in Internet Express? What about those poor people that invested in WebSnap? Not to mention Kylix or the recent VCL.NET.&nbsp; In the case of Linq To Sql, it was pretty clear that this was a mid-term solution until they had something shippable with Entity Framework, and just like everything, if you took the <a href="/blogengine/post/2008/10/31/Linq-to-Sql-is-dead-Did-you-abstract-well.aspx">necessary protection</a>, it wouldn&#039;t hit you so hard.&nbsp;
</p>

<p>
In regard to backwards compatibility, I couldn&#039;t agree more. You need to try and sustain compatibility as much as possible. However, there are times when it&#039;s near to impossible and you have to cut some ropes for the &quot;greater good&quot;. Sometimes it&#039;s not viable to allow for new functionality and/or features without making sacrifices. We had this many times on <a href="http://www.indyproject.org">Indy</a>.
</p>

<p>
He also mentions how continuously new technology comes out from Microsoft. Well here&#039;s the deal. Microsoft is a company. Just like most of us they are here to make money . They push out new technology because among other things, it generates revenue and obviously there seems to be a demand for it. It&#039;s the same as us, as developers. When working on a product we tend to continuously innovate and create new features for our end customer. Why? To try and improve their experience, to try and make it easier for them, but ultimately to also generate revenue.
</p>

<p>
At the end of the day, if you&#039;re on the bleeding edge, don&#039;t be surprised if sometimes you cut yourself. That&#039;s where you need to apply judgement and valuate the risks involved, both for yourself and your business. Nobody forces anything down your throat. You&#039;re free to continue using what you were using 5 years ago. ADO.NET still works today. All new technology is still built on top of it. You just won&#039;t get the added-value if you don&#039;t &quot;upgrade&quot;.
</p>
