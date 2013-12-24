---
layout: post
title: 'Visual Studio Achievements: Who needs clean code anyway'
categories:
- General
- JetBrains
tags:
- Architecture
- Opinion
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385521010;}
  tagazine-media: a:7:{s:7:"primary";s:58:"http://hhariri.files.wordpress.com/2011/11/image_thumb.png";s:6:"images";a:6:{s:53:"http://hhariri.files.wordpress.com/2011/11/image7.png";a:6:{s:8:"file_url";s:53:"http://hhariri.files.wordpress.com/2011/11/image7.png";s:5:"width";s:3:"487";s:6:"height";s:3:"302";s:4:"type";s:5:"image";s:4:"area";s:6:"147074";s:9:"file_path";s:0:"";}s:58:"http://hhariri.files.wordpress.com/2011/11/image_thumb.png";a:6:{s:8:"file_url";s:58:"http://hhariri.files.wordpress.com/2011/11/image_thumb.png";s:5:"width";s:3:"487";s:6:"height";s:3:"302";s:4:"type";s:5:"image";s:4:"area";s:6:"147074";s:9:"file_path";s:0:"";}s:53:"http://hhariri.files.wordpress.com/2011/11/image8.png";a:6:{s:8:"file_url";s:53:"http://hhariri.files.wordpress.com/2011/11/image8.png";s:5:"width";s:3:"448";s:6:"height";s:3:"140";s:4:"type";s:5:"image";s:4:"area";s:5:"62720";s:9:"file_path";s:0:"";}s:59:"http://hhariri.files.wordpress.com/2011/11/image_thumb1.png";a:6:{s:8:"file_url";s:59:"http://hhariri.files.wordpress.com/2011/11/image_thumb1.png";s:5:"width";s:3:"448";s:6:"height";s:3:"140";s:4:"type";s:5:"image";s:4:"area";s:5:"62720";s:9:"file_path";s:0:"";}s:53:"http://hhariri.files.wordpress.com/2011/11/image9.png";a:6:{s:8:"file_url";s:53:"http://hhariri.files.wordpress.com/2011/11/image9.png";s:5:"width";s:3:"412";s:6:"height";s:3:"129";s:4:"type";s:5:"image";s:4:"area";s:5:"53148";s:9:"file_path";s:0:"";}s:59:"http://hhariri.files.wordpress.com/2011/11/image_thumb2.png";a:6:{s:8:"file_url";s:59:"http://hhariri.files.wordpress.com/2011/11/image_thumb2.png";s:5:"width";s:3:"412";s:6:"height";s:3:"129";s:4:"type";s:5:"image";s:4:"area";s:5:"53148";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"6";s:6:"author";s:7:"5078411";s:7:"blog_id";s:8:"11677451";s:9:"mod_stamp";s:19:"2011-11-25
    08:43:12";}
  _elasticsearch_indexed_on: '2011-11-25 07:56:04'
  twitter_cards_summary_img_size: a:6:{i:0;i:487;i:1;i:302;i:2;i:3;i:3;s:24:"width="487"
    height="302"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
---
I stumbled upon <a href="http://channel9.msdn.com/achievements/visualstudio/">Visual Studio Achievements</a> this morning via <a href="http://twitter.com/#!/maartenballiauw/">Maarten</a>. The idea of combining development with game play might be enticing to some and as others have pointed out, could be a way to introduce younger generations to development and potentially get them interested. As such, the idea in itself is not an issue. What is however disturbing is the point system.

<a href="http://hhariri.files.wordpress.com/2011/11/image7.png"><img style="background-image:none;padding-left:0;padding-right:0;display:block;float:none;padding-top:0;border:0;margin:4px auto;" title="image" src="{{ site.images }}/vsa-1.png" alt="image" width="487" height="302" border="0" /></a>

If you look carefully at the entries, you find that not only do some of them promote bad practices which lead to horrendous maintenance nightmares like the Region Manager

<a href="http://hhariri.files.wordpress.com/2011/11/image8.png"><img style="background-image:none;padding-left:0;padding-right:0;display:block;float:none;padding-top:0;border:0;margin:4px auto;" title="image" src="{{ site.images }}/vsa-2.png" alt="image" width="448" height="140" border="0" /></a>

but a few of them are even geared more around selling higher end versions of the tool.

<a href="http://hhariri.files.wordpress.com/2011/11/image9.png"><img style="background-image:none;padding-left:0;padding-right:0;display:block;float:none;padding-top:0;border:0;margin:4px auto;" title="image" src="{{ site.images }}/vsa-3.png" alt="image" width="412" height="129" border="0" /></a>

Were are the points for writing a Unit Test? Or keeping the number of lines in a method low?

As many of us have learnt ourselves through our mistakes, and are somehow trying to guide others in finding better ways to develop and write cleaner code, we are suddenly confronted with something that entices developers in the opposite direction. To those companies who waste millions having to maintain bad code or rewrite systems, this is not a game.

As it stands currently, that leaderboard should probably be renamed to “Hall of Shame”.

If this a joke, or the achievements points are not real, it would be a great opportunity for MS to really think through how they go about promoting this and what really does constitute a point.
