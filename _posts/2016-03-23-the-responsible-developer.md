---
layout: post
title: The Responsible Developer
status: published
type: post
published: true
comments: true
---

Yesterday the JavaScript community was in [turmoil](http://www.theregister.co.uk/2016/03/23/npm_left_pad_chaos/). To make a long story short, someone unpublished
a few packages from the [nmpjs.com](https://npmjs.com) public repository, and one of these packages was used by many many other packages, including Node and Babel.
<br/>
<br/>
The package in question, [left-pad](https://github.com/azer/left-pad/blob/master/index.js) was 9 lines of JavaScript, counting braces, excluding
white lines and the import module statement.
<br/>
<br/>

Now I'm not going to debate why we're packaging up 9 lines of JavaScript, maybe it's because [NIH syndrome](https://en.wikipedia.org/wiki/Not_invented_here) is stronger than we think, or maybe it's just a consequence
of JavaScript not having a standard library. I'm not even going to argue about whether NPM were right in allowing some lawyers dictate what package should or shouldn't be removed.
<br/>
<br/>
Instead, what I'd like to focus on is something that caught my attention today:
<br/>
<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/Nick_Craver">@Nick_Craver</a> This is the result of someone being a jerk and not taking responsibility for the software they created.</p>&mdash; Jeff Fritz (@csharpfritz) <a href="https://twitter.com/csharpfritz/status/712455333315276800">March 23, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


I'm not sure whether Jeff was referring to NPM, in that they wrongly pulled down a package, or the author of **left-pad**. But assuming it was either of them
I strongly disagree. In fact, the only time I'd agree with such a statement is if he was referring to the developer that uses that dependency, in allowing
a critical piece of software (well fair enough 9 lines isn't critical but other packages might be), developed by a third-party person, hosted by a third-party company, potentially impact the software that they use, build and
deliver to their customers, often with no SLA's in place.

## Where did my free lunch go?
Open source software, free package repositories, all of these things are truly wonderful things. We all use OSS and public repositories in one way or another. But at the end
of the day, none of these free packages, free projects or free services necessarily owe us anything. And yet we seem to often choose to ignore this fact when we're evaluating technology and costs of what is involved with adopting something.

<br/>
If we are naive enough to believe that certain things are too centric or big to fail and us having a dependency on them is fine, then we should recall that they said the same about Lehman Brothers and other large banks.

<br/>
At the end of the day, we're exclusively responsible for the software we build and deliver to our customers. And in doing so, we have to safeguard our own dependencies in one way or another.







