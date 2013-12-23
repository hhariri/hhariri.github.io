---
layout: post
title: 'Consistency: Your best friend or your worst nightmare'
categories: []
tags:
- Architecture
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704332;}
  tagazine-media: a:7:{s:7:"primary";s:0:"";s:6:"images";a:2:{s:56:"http://hhariri.files.wordpress.com/2010/11/image9ba8.png";a:6:{s:8:"file_url";s:56:"http://hhariri.files.wordpress.com/2010/11/image9ba8.png";s:5:"width";s:3:"245";s:6:"height";s:3:"134";s:4:"type";s:5:"image";s:4:"area";s:5:"32830";s:9:"file_path";s:0:"";}s:62:"http://hhariri.files.wordpress.com/2010/11/image9ba8_thumb.png";a:6:{s:8:"file_url";s:62:"http://hhariri.files.wordpress.com/2010/11/image9ba8_thumb.png";s:5:"width";s:3:"343";s:6:"height";s:3:"189";s:4:"type";s:5:"image";s:4:"area";s:5:"64827";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"2";s:6:"author";s:7:"5078411";s:7:"blog_id";s:8:"11677451";s:9:"mod_stamp";s:19:"2010-11-03
    23:01:33";}
  _elasticsearch_indexed_on: '2010-08-30 14:37:00'
---
<p>Consistency: We developers love it don’t we?</p>  <p>We come up with beautiful architectures making sure everything is consistent. If we use a service in one place, we’ll use it everywhere. If we have a ViewModel for showing data, we’ll use a ViewModel everywhere, even if it’s not needed. Because we need to be consistent.</p>  <p>Partly I guess this is motivated because we think that being consistent helps ourselves and teammates understand what’s going on, even if that drives us to YAGNI and a series of WTF’s of why we did something that’s not required. We do it to be consistent!</p>  <p>It might seem inoffensive, but consistency can be damaging. It leads us into trying to homogenize everything despite it not being the appropriate approach in many cases.</p>  <p>So next time someone asks:</p>  <p><a href="http://hhariri.files.wordpress.com/2010/11/image9ba8.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image9ba8" border="0" alt="image9ba8" src="http://hhariri.files.wordpress.com/2010/11/image9ba8_thumb.png" width="343" height="189" /></a> </p>  <p>…it’s cause we like to be consistent!</p>  <p>Breaking consistency when required not only <a href="http://www.osnews.com/story/19266/WTFs_m">lowers levels of WTF’s</a>, <a href="http://en.wikipedia.org/wiki/Eventual_consistency">it can even help scalability</a>!</p>
