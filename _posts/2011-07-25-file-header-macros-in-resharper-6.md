---
layout: post
title: File Header Macros in ReSharper 6
categories:
- JetBrains
tags:
- JetBrains
- ReSharper
- ReSharper 6
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704306;}
  _elasticsearch_indexed_on: '2011-07-25 08:37:10'
  twitter_cards_summary_img_size: a:6:{i:0;i:562;i:1;i:480;i:2;i:3;i:3;s:24:"width="562"
    height="480"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
comments: true
---
Sometime ago I wrote about <a href="http://hadihariri.com/2010/12/20/automating-file-header-information-with-resharper/">Automating File Header Information</a>, showing how to insert license information and other data in project files. One of the shortcomings ReSharper had however was the inability to support macros. Something as simple as inserting the current year or filename required the support of StyleCopy for ReSharper. ReSharper 6 now support macros allowing file headers to contain varying information:

<a href="http://hhariri.files.wordpress.com/2011/07/snaghtml13afe47c2.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;margin:10px 0 0;" title="SNAGHTML13afe47c" src="http://hhariri.files.wordpress.com/2011/07/snaghtml13afe47c_thumb2.png" alt="SNAGHTML13afe47c" width="500" height="420" border="0" /></a>

For instance, in the previous license header, the Copyright years are fixed to 2010 – 2011. It also has no information relevant to the actual project. We could of course hardcode the name of the project in there but since this setting is not solution-specific, it would be of little use. Other data such a filenames however would be impossible to do.

With ReSharper 6 we simply remove the hardcoded values and replace them with macros. We can either type them in or click on the corresponding macro, which will insert it at current cursor position:

<a href="http://hhariri.files.wordpress.com/2011/07/image8.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:10px 0 0;" title="image" src="http://hhariri.files.wordpress.com/2011/07/image_thumb8.png" alt="image" width="432" height="91" border="0" /></a>

With this change in place, next time we run a code-cleanup and have the Update File Header option activated, we will get up to date and project/file specific header information inserted. Next feature request: <a href="http://youtrack.jetbrains.net/issue/RSRP-274379">Custom Macros</a>!
