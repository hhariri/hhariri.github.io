---
layout: post
title: Integrating OpenID and ASP.NET MVC
categories: []
tags:
- ASP.NET MVC
- OSS
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1365081023;}
  _elasticsearch_indexed_on: '2008-12-28 16:08:31'
---
<p><a href="http://openid.net/">OpenID</a> (Microsoft Passport done right), is gaining a lot of popularity and it's common to see it integrated into new and existing web sites. For those not familiar with OpenID, here's a quote from the web site:</p>  <p>&#160;</p>  <blockquote>   <p>For geeks, OpenID is an open, decentralized, free framework for user-centric digital identity. OpenID takes advantage of already existing internet technology (URI, HTTP, SSL, Diffie-Hellman) and realizes that people are already creating identities for themselves whether it be at their blog, photostream, profile page, etc. With OpenID you can easily transform one of these existing URIs into an account which can be used at sites which support OpenID logins.</p> </blockquote>  <p>I'm currently working on a project with ASP.NET MVC and since it requires a login, I decided to offer the option for users to use OpenID as a means of authentication. The &quot;de-facto&quot; library of choice it seems is <a href="http://code.google.com/p/dotnetopenid/">.NET OpenID</a> which is available on Google Code. It actually comes with a demo of how to use it with ASP.NET MVC but I have a feeling it was done with the very first CTP of MVC since there are direct accesses to the form object, etc. which isn't really necessary. Having said that, the library is extremely easy to use and I was up and running in about 5 mins. You can download the updated demo below. The code is extremely straight-forward, but if you have trouble understanding anything, just ping me.</p>  <div class="wlWriterSmartContent" id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:423f6e32-27a9-4f1a-80b0-790a29ca965e" style="display:inline;margin:0;padding:0;"><p><div><a href="http://hadihariri.com/blogengine/file.axd?file=WindowsLiveWriter/IntegratingOpenIDandASP.NETMVC_E4C9/OpenId.zip" target="_self">OpenId.zip</a></div></p></div>
