---
layout: post
title: 'YouTrackSharp: A .NET Client for YouTrack'
categories:
- General
- JetBrains
tags:
- JetBrains
- YouTrack
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704308;}
  _elasticsearch_indexed_on: '2011-06-26 10:00:34'
comments: true
---
<p align="left">On and off I’ve been working on a .NET library that is a wrapper around <a href="http://www.jetbrains.com/youtrack/">YouTrack</a> ReST API’s.  If you’re not familiar with <a href="http://www.jetbrains.com/youtrack/">YouTrack</a>, it’s our Web-Based Issue Management system, which is currently at version 3 and recently we announced the <a href="http://www.jetbrains.com/youtrack/buy/index.jsp">availability of a free version</a>. If you like keyboard-centric tools (like for instance <a href="http://www.jetbrains.com/resharper">ReSharper</a>), you’ll love YouTrack.</p>
<p align="left">YouTrack offers quite a lot of possibilities when it comes to interacting with it. I’ve previously <a href="http://hadihariri.com/2010/12/14/generating-graphs-for-youtrack-with-html-5-and-jquery/">blogged about how we can easily</a> create some HTML 5 graphs using nothing but the ReST API and some jQuery. Of course, we could also take advantage of this API from .NET using merely an <a href="http://hadihariri.com/2011/01/16/easyhttp/">HTTP client</a>.</p>

<h2 align="left">YouTrackSharp</h2>
<p align="left">What YouTrackSharp brings to the table is a compact interface to work with YouTrack without worrying about things like cookies, URL’s and other HTTP concerns. It abstracts all that away to provide a simple series of classes to work with YouTrack.</p>
<p align="left">Here’s a sample of a command line app I just wrote to make feature logging easier for ReSharper:</p>

<div id="scid:9ce6104f-a9aa-4a17-a79f-3a39532ebf7c:ed07736c-dbcc-43b4-9370-bd05ee44e98c" class="wlWriterEditableSmartContent" style="display:inline;float:none;margin:0;padding:0;">
<div style="border:#000080 1px solid;color:#000;font-family:'Courier New', Courier, Monospace;font-size:10pt;">
<div style="background-color:#ffffff;overflow:auto;white-space:nowrap;padding:2px 5px;"><span style="color:#0000ff;">var</span> connection = <span style="color:#0000ff;">new</span> <span style="color:#2b91af;">Connection</span>(<span style="color:#a31515;">"youtrack.jetbrains.net"</span>);connection.Authenticate(<span style="color:#a31515;">"username"</span>, <span style="color:#a31515;">"password"</span>);

<span style="color:#0000ff;">var</span> issueManagement = <span style="color:#0000ff;">new</span> <span style="color:#2b91af;">IssueManagement</span>(connection);

<span style="color:#0000ff;">var</span> issue = <span style="color:#0000ff;">new</span> <span style="color:#2b91af;">Issue</span>
{
Assignee = <span style="color:#a31515;">"ReSharperProjectManager"</span>,
Summary = summary,
Description = description,
ProjectShortName = <span style="color:#a31515;">"RSRP"</span>,
Type = <span style="color:#a31515;">"Feature"</span>
};

issueManagement.CreateIssue(issue);

<span style="color:#2b91af;">Console</span>.WriteLine(<span style="color:#a31515;">"Feature request logged"</span>);

</div>
</div>
</div>
Currently it allows you to Create Issues, Upload Attachments, Get Issues, Apply Commands to issues as well as a bunch of tasks on Projects. I’m adding features as and when I can, so if there’s something you’d like, <a href="http://youtrack.codebetter.com/issues/YTSRP">log it here</a>.
<h2>How to use it</h2>
YouTrackSharp is available as a <a href="http://www.nuget.org">NuGet package</a> and source code is available on <a href="http://github.com/hhariri">GitHub</a>. To use it, just do:

<span style="font-family:Courier New;">install-package YouTrackSharp </span>

You first need to create a <em>Connection </em>object (providing host) and then either a <em>IssueManagement </em>or <em>ProjectManagement</em>  based on what you need to do. The classes are simple and the methods should be self explanatory. The project also comes with tests using MSpec which describe many scenarios. If you have any questions, <a href="http://twitter.com/hhariri">shout!</a>
<h2>Ruby</h2>
If you are a Ruby developer, know that Anna Zhdan, a colleague at JetBrains, has also started working on a Ruby library for YouTrack, which is available on <a href="https://github.com/anna239/youtrack-rest-ruby-library">GitHub</a>
