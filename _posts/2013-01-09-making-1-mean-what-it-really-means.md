---
layout: post
title: Making +1 mean what it really means
categories:
- JetBrains
tags:
- Workflow
- YouTrack
status: publish
type: post
published: true
meta:
  _publicize_pending: '1'
  _elasticsearch_indexed_on: '2013-01-09 21:07:18'
  twitter_cards_summary_img_size: a:6:{i:0;i:1200;i:1;i:202;i:2;i:3;i:3;s:25:"width="1200"
    height="202"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
comments: true
---
On YouTrack, you can vote for issues. There's a button right at the top, beneath the title. It's quite big. It doesn't say "Vote" but it's still pretty apparent 

<img src="http://blog.jetbrains.com/youtrack/files/2013/01/VoteButton.png" alt="Vote Button" border="0" width="600" height="101" />

The problem is, that not everybody seems to see the button. In addition, in a world of Like and +1, what tends to happen is that we end up with a lot of comments like this:

<img src="http://blog.jetbrains.com/youtrack/files/2013/01/NewImage.png" alt="NewImage" border="0" width="600" height="381" />

So how should we fix it? Make the vote button bigger? Place a couple here and there? I asked this question on Twitter a few days ago and one of the more common responses was: 

<em>"Can't you add a feature to YouTrack to make +1 add a vote?"</em>

<h3>Workflows save the day...again</h3>

Well, good news is that we can. But the even better news is that we don't need to add a feature, and consequently you don't need to wait for us to ship this feature if you're also encountering this problem. We can actually solve this using Workflows. If you're not familiar with workflows, think of it as a way to get <a href="http://blog.jetbrains.com/youtrack/2012/02/spicing-up-youtrack-with-workflows/">YouTrack to pretty much do whatever you want</a>.   

The workflow is actually quite simple:

<img src="http://blog.jetbrains.com/youtrack/files/2013/01/workflow.png" alt="Workflow" border="0" width="600" height="116" />

With a simple rule like the above, attached as workflow to your project, any +1 comment will now be interpreted as a vote and a nice message displayed to the user. 

<img src="http://blog.jetbrains.com/youtrack/files/2013/01/MEssageonvote.png" alt="Message on Vote" border="0" width="600" height="84" />

Just write the workflow, upload it to the server and attach it. 

<h3>Shipping out of the box</h3>

As of YouTrack 4.2, this workflow will <a href="http://youtrack.jetbrains.com/issue/JT-16359">already ship out of the box</a>. Until then, and using your current version of YouTrack, you can create the workflow, attach it and you're good to go.
