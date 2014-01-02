---
layout: post
title: Too many dependencies?
categories:
- General
tags:
- Architecture
- Design
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1368096692;}
  tagazine-media: a:7:{s:7:"primary";s:53:"http://hhariri.files.wordpress.com/2012/04/image4.png";s:6:"images";a:1:{s:53:"http://hhariri.files.wordpress.com/2012/04/image4.png";a:6:{s:8:"file_url";s:53:"http://hhariri.files.wordpress.com/2012/04/image4.png";s:5:"width";s:3:"519";s:6:"height";s:3:"470";s:4:"type";s:5:"image";s:4:"area";s:6:"243930";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"1";s:6:"author";s:7:"5078411";s:7:"blog_id";s:8:"11677451";s:9:"mod_stamp";s:19:"2012-04-09
    09:31:27";}
  _elasticsearch_indexed_on: '2012-04-09 09:30:46'
comments: true
---
<p>Over the weekend <a href="http://hadihariri.com/2012/04/07/test-setups-and-design-smells/">I blogged about a recurrent issue I encounter when looking at tests</a>, which is the encapsulation of the <em>Arrange </em>part of the <em>Arrange-Act-Assert </em>pattern in either setup methods or base classes. Although there are justified use-cases for it, the majority of times it’s a sign of a code smell. </p> <p>The example I put was one of a Controller having too many dependencies, and I was asked a few times how to avoid this problem. The purpose of the blog post was not around this issue itself but around test setups. However, it is a valid question, and one that has been raised over the past months questioning the usage of IoC Containers.</p> <p>So I wonder, do you think this is a problem? If so, how many dependencies is too many? How would you avoid it? </p> <p>&nbsp;</p> <p>
<img src="{{ site.images }}/tmd-1.png"></p>
