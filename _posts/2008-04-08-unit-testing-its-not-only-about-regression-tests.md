---
layout: post
title: 'Unit testing: it''s not only about regression tests'
categories: []
tags: []
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-04-08 11:02:00'
comments: true
---
<p>A lot of times when you&#039;re introduced to Unit Testing, you&#039;re sold on the fact that it&#039;s the best way to have regression testing in place. That&#039;s 100% accurate. Whether you practice Test Driven Development or take a test-after (test-last, POUT, whatever you want to call it....) approach, creating unit tests allows you to test changes in your code and make sure that bug fix, change or new feature hasn&#039;t broken any functionality. However, one of the great added values to Unit Testing that often doesn&#039;t get as much attention as it should, although always present, is documentation. </p>  <p>How many times have you come across some piece of code that you needed to change and was wondering why you did something the way you did? Talk to your colleagues, look for documentation, look for comments, only to find nobody recalls anything and not one word jotted down anywhere about it. This is where a good suite of unit tests come in handy. If you have tests that verify behavior of your code, and also make sure that your code coverage is quite high (over 80%), you have a good chance to find out why something is coded in a particular way. Even if you don&#039;t name your tests with a &quot;specification orientated&quot; convention, it is still very valuable to know that when you make that change, your tests still run. And the higher the code coverage, the less chances are that something will fail on deployment. </p>  <p>So whether or not you or your colleagues recall why you did something in a particular way, you might not need to if you document your code with tests.</p>
