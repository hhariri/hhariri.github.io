---
layout: post
title: RC means something
status: published
type: post
published: true
comments: true
---

## The .NET Storm

If you're not aware of what's been going on in the .NET community with regard to .NET Core, here's a good summary by [Aaron](http://www.aaronstannard.com/dotnetcore-boil-ocean/). I share his views on many things, yet several discussions I've had on Twitter seem to end up focusing on the wrong aspects of the issue with what's happening with .NET Core. And thus, this post.



<br/>
I suggest you read it, but to summarise things - a lot of changes are constantly happening with .NET Core. Project format files, mscorlib going and coming, new API's, etc.

<br/>
You can argue whether these changes are good or bad, the reasons behind them or what has influenced them. What you cannot deny though is that there are significant changes.

<br/>
Why is that a problem? Well, in principle it's not. Many projects are constantly evolving and adapting to change, I mean after all, that's what agile is right? And .NET Core is now an Open Source project so we're seeing this first hand. We're seeing more transparency in the **results** of the decisions. And note there the emphasis on **results**, meaning that many decisions can be made behind closed doors and then communicated. Now some may disagree with this, but the fact that a project is OSS doesn't imply that architectural decisions necessarily need to be commitee-driven by the community at large. Expecting that is quite naive.

<br/>
So it would seem that there really isn't a problem. Well, if you're drinking from the firehose and building or training on the platform, it can cause you a few headaches and time and money (somebody is paying the bills), but as some have pointed out, you pay to play. That's the price of living on the edge.


## The Software Release Lifecycle
Then what exactly is the turmoil about?

<br/>
Well, in my book (and that of many), it's called setting the wrong expectations. In software, by and large, we have come to standardise on using certain annotations to designate the state of a product during its [lifecycle](https://en.wikipedia.org/wiki/Software_release_life_cycle). These are:

- Pre-Alpha
- Alpha
- Beta
- RC or Release Candidate
- RTM or Ready To Manufacture

<br/>
Release candidate in particular means

>A release candidate (RC) is a beta version with potential to be a final product, which is ready to release unless significant bugs emerge. In this stage of product stabilization, all product features have been designed, coded and tested through one or more beta cycles with no known showstopper-class bugs. A release is called code complete when the development team agrees that no entirely new source code will be added to this release. There could still be source code changes to fix defects, changes to documentation and data files, and peripheral code for test cases or utilities. Beta testers, if privately selected, will often be credited for using the release candidate as though it were a finished product. Beta testing is conducted in a client's or customer's location and to test the software from a user's perspective.



<br/>
Or to put another way - **unless some critical bugs pop up, we're good to go**.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/FransBouma">@FransBouma</a> We used acronyms like Beta, RC, RTM with honour, with pride, with commitment. <br><br>Today, they’re used as a punch line on Twitter.</p>&mdash; Hadi Hariri (@hhariri) <a href="https://twitter.com/hhariri/status/689724407493873664">January 20, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<br/>
What RC doesn't mean is - let's change a whole bunch of fundamental things, including tooling, API's, etc.

<br/>
**This** is the problem. When you call something RC, give Go Live licenses, then make significant changes, then come out with RC2, and then a Preview  and then change more things, you're confusing people. From one side you're telling those that build on your platform that it's pretty much ready to go and then two days later you're changing of things and breaking stuff.

## Loss of confidence

Do this once, and people will forgive you. Do it several times and people will start to feel upset, and this is exactly what I believe is the general sentiment right now amongst many in the community.

<br/>
When the alpha-geeks of your technology are starting to get fed up of constantly porting their libraries, promoting and in general advocating your platform, you know things aren't going in the right direction.

<br/>
These people are putting in their time, their money, and most importantly, at times their own reputations with their customers in supporting you. You cannot expect that this has no impact on your users and community.

<br/>
Sure, it's great that as consultants, trainers or speakers, these constant changes give us new material to build on, but somebody, somewhere is paying the price.

<br/>
Some say that .NET Core was an attempt to keep those developers fleeing the platform to stay. Others say it's about trying to attract new ones. Microsoft know better what their intentions are, but I think one thing they really shouldn't forget are all those developers that are using their platform, building on their platform, tooling their platform and have come to expect a certain level of stability and direction. This kind of approach isn't helping anyone.

## Setting expectations

I believe that the .NET Core team need to first and foremost admit that things aren't ready and drop the whole RC/Preview and Go Live licenses charade, setting the right expectations. Then, without rushing, analyse exactly where it is they want to head in terms of the platform's direction, and not be swayed by the next hype that pops up and causes a major shift in their vision.

Having this, and more importantly, communicating it well, will lead the way to a better execution, delivery, and most importantly, support of the community.

<br/>
In summary, the turmoil isn't about changes, it's about setting expectations and respecting your users, your community.

