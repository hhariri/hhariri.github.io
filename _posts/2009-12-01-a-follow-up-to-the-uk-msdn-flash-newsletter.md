---
layout: post
title: A Follow-up to the UK MSDN Flash Newsletter
categories: []
tags:
- Architecture
- MSpec
- Unit Testing
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-12-01 16:40:00'
comments: true
---
<p>
I recently wrote a small 500 word article on Behavior Driven Development and
the subtle differences between it and Test Driven Development. However, there
isn&rsquo;t much you can talk about in 500 words and it makes it even harder if you
can&rsquo;t really format code or show images. We agreed with <a href="/blogengine/admin/Pages/Eric%20Nelson">Eric Nelson</a> that I would post some images of what I was
referring to in the article, on my blog. The newsletter should go out today, as
such, here is the follow-up post.
</p>
<p>
<strong>Snapshot 1:</strong> <br />
Test written using MSpec in C#. The
<strong>Establish</strong> is used to setup the actual scenario. The
<strong>Because</strong> is where the actual action takes place. Finally the
<strong>It</strong> sections are where the assertions happen, where we verify
the behavior.
</p>
<br />
<p>
&nbsp;
</p>
<p>
<a href="/Users/Hadi%20Hariri/AppData/Local/Temp/WindowsLiveWriter-429641856/supfiles650D3B3/image3.png"><br />
</a>
</p>
<img src="/blogengine/image.axd?picture=2009%2f12%2fPic1.png" alt="" /><br />
<br />
<p>
<a href="/Users/Hadi%20Hariri/AppData/Local/Temp/WindowsLiveWriter-429641856/supfiles650D3B3/image7.png"><br />
</a>
</p>
<p>
<strong>Snapshot 2:</strong> <br />
Output of the test run using TestDriven.NET.
It is generated using the class name and the <strong>It</strong> declarations to
produce a nicely formatted output (removing the underscores)
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<img src="/blogengine/image.axd?picture=2009%2f12%2fPic2.png" alt="" />
