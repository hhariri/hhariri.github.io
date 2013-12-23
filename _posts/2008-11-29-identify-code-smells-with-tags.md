---
layout: post
title: Identify code smells with tags
categories: []
tags:
- Process
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-11-29 10:27:00'
---
<p>
Visual Studio comes with TODO markers where you can mark sections of code with little comments to indicate that you need to do something. However, TODO sometimes becomes too generic. You start to mark tasks, features, futures, (bugs have their own by default) with the same tag. Fortunately you can add custom ones. If you have Re-sharper installed, you get additional benefits since it allows you to create filters, identify the tags inside comments and highlight them on the right margin.
</p>

<p>
One tag to add is SMELL. A code smell is a piece of code that works yet it just isn&#039;t right, and you know that the longer it&#039;s left in there, there worse it can get. It can lead to an unsustainable situation where the whole project can start to smell like a dump site. Other times it&#039;s just a small section that is isolated and won&#039;t have immediate side-effects, but would be good to get it cleaned up.
</p>

<p>
Now, I know the purists would probably scream and say that any smell should be eradicated then and there. Snap back to reality. Both you and I know that that&#039;s not always viable. Having said that, If it&#039;s a bad smell that can lead down a spiral of stink, then yes, it should be, taking into account schedules, etc.. but even in that case, you&#039;re not going to do it all at once, so you still need to identify the smells as you go cleaning them up.
</p>

<p>
Here&#039;s some screen shots of smells with Resharper
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/Identifycodesmells_8C93/image_2.png"><img style="border:0 none;" src="/blogengine/image.axd?picture=WindowsLiveWriter/Identifycodesmells_8C93/image_thumb.png" border="0" alt="image" width="244" height="114" /></a>
</p>

<p>
To define them, use Resharper&#039;s To-Do item entry
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/Identifycodesmells_8C93/image_6.png"><img style="border:0 none;" src="/blogengine/image.axd?picture=WindowsLiveWriter/Identifycodesmells_8C93/image_thumb_2.png" border="0" alt="image" width="244" height="133" /></a>
</p>

<p>
You can also see on the To-Do Explorer
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/Identifycodesmells_8C93/image_8.png"><img style="border:0 none;" src="/blogengine/image.axd?picture=WindowsLiveWriter/Identifycodesmells_8C93/image_thumb_3.png" border="0" alt="image" width="216" height="244" /></a>
</p>
