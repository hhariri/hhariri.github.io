---
layout: post
title: A few words on Git.
status: published
type: post
published: true
comments: true
---

I tweeted something about Git. Do I regret it? A little bit. Why? Because it had a grammar mistake.
<br/>
<br/>


<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Git is not a success story. Git is a failure as a system with a crap user experience that forces you to learn more about the tool you&#39;re using that about getting your work done.</p>&mdash; Hadi Hariri (@hhariri) <a href="https://twitter.com/hhariri/status/1314178925610885120?ref_src=twsrc%5Etfw">October 8, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
<br/>
<br/>


The tweet made some rounds and died off. Then someone posted it on Hacker News, and it made more rounds, and then it died.
Then someone posted it on Reddit, and the damn thing just doesn't die off!

## The feedback

The replies to the tweet can be grouped in two:
<br/>
<br/>


1. Folks that agree
2. Those that don't agree (and some are very angry)


<br/>
<br/>
I want to address the second group because it seems many of them don't seem to get my point, and I keep
repeating myself in replies to the tweet. Of course, it's wishful thinking if anyone reads this post because at times,
I find folks often don't even read Twitter threads.
<br/>
<br/>


Having said that, let's try and categorize the responses:
<br/>
<br/>

### You're an idiot for saying it's not successful. It's used everywhere!

Let's first address what I mean by success. If we're talking about reach, Git is successful, yes. It's
probably the most used Version Control system. If we're talking about people being frustrated and banging their
heads to the wall because of Git, I'd say it probably is also successful.
<br/>
<br/>


Jokes aside though, the success I was talking about is actually in the context of the tweet - it is not (remember, this is my opinion)
successful at its job of being a distributed version control system, because it fails at the user experience. More on why later.
<br/>
<br/>


So let's put success into context - especially on Twitter. Remember we only read single tweets.
<br/>
<br/>

### You're a professional. Learn the tool or GTFO.

I suck at Git. But let's say for a moment that I didn't suck at Git. The response of "learn the tool" is not only
assuming that you know my knowledge about Git, but also implying that everything is wonderful, and the problem lies only
in that we, as users, don't have enough knowledge.
<br/>
<br/>


In this category, there's also the
<br/>
<br/>

*"Git isn't for average developers"*
<br/>
<br/>


Great. Well, consider me average. Now allow me to complain.
<br/>
<br/>

That a tool is complex isn't something that should be seen as meritable. What's meritable is making that difficult simple. More on that later.

### If you don't like CLI, use a GUI

*"If you don't like the command line, use a GUI"*
<br/>
<br/>


Someone even told me that IntelliJ IDEA has a GUI tool. I WAS NOT AWARE!
<br/>
<br/>


I actually am a fan of command line tools, but that's not the point. What's shocking is how folks quickly
equate the bad user experience of Git with it being a command line tool. While obviously having to remember
commands, their parameters, and orders in which they're applied isn't the most useful usage of one's time,
user experience isn't just about whether the interface is textual or graphical. As I mentioned in another
tweet
<br/>
<br/>

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">The UI affects the UX but the UX isn&#39;t just about the UI. Putting nicer lipstick on a pig is still a pig.</p>&mdash; Hadi Hariri (@hhariri) <a href="https://twitter.com/hhariri/status/1314523004655874048?ref_src=twsrc%5Etfw">October 9, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

### Git is just a folder, and branches are just pointers.

*"Git is actually quite simple, if you understand how it works under the covers"*
<br/>
<br/>


I'm sure it is, but why would I need to understand how a tool works under the covers to be able to use it effectively? Do you understand
how IntelliJ IDEA parses an abstract syntax tree or what the PSI is, when you want to perform a refactoring?

### Git is better than what we had

This reasoning is - “well it's better than SVN or CVS, so stop complaining”.
<br/>
<br/>


Sure, and SVN was better than zipping up files and sharing them on a drive. Point being? That because
we've improved (in some aspects) on previous tools, we should just accept that Git is it? This is as good as it's going to
get?
<br/>
<br/>

## The Git User Experience

Now, coming back to the actual user experience.
<br/>
<br/>


As a developer, technical writer, build engineer {place here any other job that leads you to use version control}, I want to
get my work done. This could be fixing bugs, creating features, writing documents, whatever it is. My focus should be on my job, not on grunt work.
<br/>
<br/>

### Safety

When I use a version control system I'd like a system that doesn't make me want to make local copies of my files in case I screw things up, and then have to:
<br/>
<br/>


```
rm -rf /project
git clone git@....
```

<br/>
(btw, lost count the number of times folks have thanked us for [Local History in IntelliJ platform](https://www.jetbrains.com/help/idea/local-history.html) because they messed up with Git)
<br/>
<br/>


But you could say "Hadi learn your tool, so you don't mess up". Sure I could, but I'd also like to have a tool that doesn't make it
overwhelmingly simple for me to mess-up.

### Workflows

When I use a version control system, I'd like that system to take care of remembering my workflow for me, not have me remember it.
<br/>
<br/>


```
git branch
git checkout
rebase

oh wait, was it merge?

Crap. Back to git clone
```

You could say you get used to it. I'm sure I would, but why should I? Why should I have to add this to my workflow? We seem to
take pride as developers in automating things. We go and brag at conferences about how "With a single click I can deploy my system to my customers". And yet
when it comes to version control - it's OK to remember manual steps. Not only remember them, but take pride in the ceremony.
<br/>
<br/>


*"But DVCS is complex"*
<br/>
<br/>


They say...
<br/>
<br/>


Why is it so far-fetched that I'd like a tool to allow me to define my branching/collaboration strategy and help me do it without surfacing the complexity?
<br/>
<br/>


## In summary

Many people were angry at me for saying that Git isn't a success, that while I had valid points, GIT (as some call it) is successful. Once again,
it really does depend on what you mean by success, and I tried to have a self-contained tweet define that. Did I fail at that? Probably. I'll do better
next time. However, I still stand by what I've said in this post - Yes, DVCS is complex. So is collaboration, but that doesn't mean that
tools should surface this complexity or make us perform manual error-prone repetitive tasks. Whether that tool is something written from scratch, or an abstraction
over Git is an implementation detail if you will.  
<br/>
<br/>


In regard to Git's success in terms of usage, yes it has been successful, and I'm pretty sure GitHub has had quite a lot to do with it. I mean even
at JetBrains we only support Git on our new product Space. However, **the fact that something is widely used doesn't mean that we cannot do better**.
<br/>
<br/>


Or have we all forgotten Sourceforge?






