---
layout: post
title: Dynamic types and ASP.NET MVC
categories: []
tags:
- ASP.NET MVC
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-12-30 12:25:00'
---
<p>
If you&rsquo;re using ViewModels in your ASP.NET MVC applications, know that if working with .NET 4.0, you can now create dynamic view models. And it&rsquo;s actually very simple to do.
</p>
<p>
Create an ExpandoObject to represent your ViewModel:
</p>
<p>
&nbsp;
</p>
<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/DynamictypesandASP.NETMVC/7D1D9B33/image.png"><img style="border:0 none;display:inline;" src="/blogengine/image.axd?picture=WindowsLiveWriter/DynamictypesandASP.NETMVC/4D1349B2/image_thumb.png" border="0" alt="image" title="image" width="438" height="325" /></a>
</p>
<p>
Declare your view to be of type ViewPage&lt;dynamic&gt;
</p>
<p>
&nbsp;
</p>
<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/DynamictypesandASP.NETMVC/08A332A6/image.png"><img style="border:0 none;display:inline;" src="/blogengine/image.axd?picture=WindowsLiveWriter/DynamictypesandASP.NETMVC/020FB316/image_thumb.png" border="0" alt="image" title="image" width="460" height="270" /></a>
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
And you&rsquo;re done. Here&rsquo;s the output:
</p>
<p>
&nbsp;
</p>
<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/DynamictypesandASP.NETMVC/413DB6E6/image.png"><img style="border:0 none;display:inline;" src="/blogengine/image.axd?picture=WindowsLiveWriter/DynamictypesandASP.NETMVC/1B679083/image_thumb.png" border="0" alt="image" title="image" width="458" height="317" /></a>
</p>
<p>
&nbsp;
</p>
<p>
If you&rsquo;re using <a href="http://www.jetbrains.com/resharper">ReSharper</a>, you will get <a href="/blogengine/post/2009/11/24/Dynamic-objects-and-ReSharper.aspx">Intellisense</a> once you&rsquo;ve declared a property once (both in the Action as well as the View).
</p>
