---
layout: post
title: Resharper 5 support for MVC
categories: []
tags:
- ASP.NET MVC
- ReSharper
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-10-09 21:17:44'
comments: true
---
<p>&#160;</p>  <p>Resharper 5 has a couple of new features for MVC that can make your life somewhat easier. Take a look at the following screenshot:</p>  <p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/Resharper5supportforMVC/0ACB9367/image.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image" border="0" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/Resharper5supportforMVC/0E1D0542/image_thumb.png" width="582" height="136" /></a> </p>  <p>That’s inside an ASPX ViewPage. The first thing is the <strong>“Abouta”</strong> underlined in blue. The hint tells me that this action does not exist. <strong>“Home”</strong> on the other hand, which corresponds to a controller is underlined, meaning you can navigate to it from there (ctrl+left mouse click).</p>  <p>In the case of the action not existing, if we haven’t spelt it wrong, we can ask Resharper to create it for us:</p>  <p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/Resharper5supportforMVC/7CE9279E/image.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image" border="0" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/Resharper5supportforMVC/4940BB40/image_thumb.png" width="578" height="145" /></a> </p>  <p>which generates the corresponding action in the controller:</p>  <p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/Resharper5supportforMVC/38791092/image.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image" border="0" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/Resharper5supportforMVC/30153B3B/image_thumb.png" width="581" height="158" /></a> </p>  <p>Simple, yet very productive!</p>
