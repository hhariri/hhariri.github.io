---
layout: post
title: 'TDD: your insurance policy'
categories:
- General
tags:
- Design
- TDD
- Unit Testing
status: publish
type: post
published: true
meta:
  tagazine-media: a:7:{s:7:"primary";s:0:"";s:6:"images";a:0:{}s:6:"videos";a:0:{}s:11:"image_count";i:0;s:6:"author";s:7:"5078411";s:7:"blog_id";s:8:"11677451";s:9:"mod_stamp";s:19:"2012-10-01
    15:20:14";}
  _elasticsearch_indexed_on: '2012-10-01 14:58:09'
comments: true
---
Every now and again I read a post or comment around the topic of TDD and how it constitutes a somewhat futile effort. Forgetting for a moment TDD, let me say a few words around unit testing.

I'm not going to argue or layout the benefits of why putting in place an automated test system for your code is a good idea. I think we are well beyond that discussion and most of us accept it. As such, let us assume that we have unit tests.
<h3>Test First or Test After</h3>
In order to get these unit tests in place, we have to write them. Here we have two different approaches: test first or test after. In other words, we can either write code and then test or write a test and then implement the code.

With the first approach, that is, writing tests after writing the code, we not only face the challenge of writing a test for something that we perceive as 'working', but we also run the risk of creating code that is somewhat hard to test. As the project progresses and the deadlines approach, we tend to drop or 'defer' some tests and start to rush more into getting code out the door. After all, what is a perfectly tested codebase if it is not shipped?

What potentially ends up happening, which I've seen far too many times, is that we never get round to implementing the missing tests, much like we do not normally go back and pay for technical debt. And of course, this means that our code is at a higher risk of malfunctioning and ultimately costing us money.

If we take a test first approach, we are forced to write a test prior to writing the code. As such we have the test in place. We don't need to come back later after writing the code to write the test. In addition, since we write the tests first, we can immediately solve any issues that lead to untestable code, after all, we're writing the code we want to test, so why write it in a way that is not testable if we know beforehand? It's not like we have written all the code, then come to test it and realized, oops! Yet this is something that does occur in test after approaches and often requires even more effort and thus easier to 'justify' skipping a test or two.

Taking the TDD route, we have less chances of ending up with code that is not tested. We have less risks of leaving a test for later, a moment that never arrives.

You could say that it's a matter of discipline, that just like we commit to TDD and always writing tests first, we can also commit to writing tests after. And I agree, we can. But reality shows that we don't. Psychologically, there is less chances of us writing a test for something that is 'working' than for something that is not.
<h3>TDD as an insurance you took out</h3>
Now the reality is that TDD isn't actually about testing as much as it is about design. It is not about test first versus test after. It is about trying to better understand a system, about trying to break things down into pieces our mind can cope with (divide and conquer). It is about specifications. And while I dislike using the word side-effect, the unit tests that emerge from TDD not only guarantee the correct implementation (different to understanding correctly the specification) but also, and more importantly, serve as a regression test.  You could therefore think of a unit test in TDD as having three different life forms.

This regression testing is where the analogy to insurance policies comes in, cause even f you don't believe in the benefits of TDD as a whole, at least consider that it is like that insurance policy which you did take out on the first day, as opposed to the one you kept delaying until it was too late.
