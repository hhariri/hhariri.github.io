---
layout: post
title: Dynamic objects and ReSharper
categories: []
tags:
- ReSharper
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-11-24 19:38:00'
comments: true
---
<p>
&nbsp;
</p>

<p>
As you might have heard by now, C# 4.0 (or is it just 4?&hellip;) comes with a new keyword: <strong>dynamic</strong>. This means that you could do something like the following:
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/0CC960B8/image.png"><img style="border:0 none;display:inline;" src="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/35F0F8F6/image_thumb.png" border="0" alt="image" title="image" width="480" height="82" /></a>
</p>

<p>
Simply put, ExpandoObject is a class that allows you to add and remove members at runtime. This allows us to call methods that are resolved at runtime. As such, the previous code will compile.
</p>

<p>
Just as you can declare methods, you can also declare properties:
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/7331ADBD/image.png"><img style="border:0 none;display:inline;" src="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/7F5327E4/image_thumb.png" border="0" alt="image" title="image" width="477" height="85" /></a>
</p>

<p>
This no doubt can come in handy when working with ViewModels and ASP.NET MVC.
</p>

<p>
However, there is one minor problem with dynamic objects: you lose intellisense, which means that if in your view, instead of typing <em>dynaCustomer.FirstName</em>, you type <em>dynaCustomer.FristName</em>, you won&rsquo;t get any errors until you run the app.
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/63CE25E1/image.png"><img style="border:0 none;display:inline;" src="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/3AE310D8/image_thumb.png" border="0" alt="image" title="image" width="472" height="172" /></a>
</p>

<p>
And that&rsquo;s where ReSharper can help:
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/1E85A8EB/image.png"><img style="border:0 none;display:inline;" src="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/1C68AA22/image_thumb.png" border="0" alt="image" title="image" width="468" height="230" /></a>
</p>

<p>
This is the same code, but with ReSharper activated inside Visual Studio 2010! I typed the <em>FirstName </em>property for the first time. After that, I have full intellisense support for it. The same would apply to methods:
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/43734397/image.png"><img style="border:0 none;display:inline;" src="/blogengine/image.axd?picture=WindowsLiveWriter/DynamicobjectsandReSharper/67B82819/image_thumb.png" border="0" alt="image" title="image" width="470" height="173" /></a>
</p>

<p>
That puts <em>dynamic </em>into perspective.
</p>
