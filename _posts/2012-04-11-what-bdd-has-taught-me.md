---
layout: post
title: What BDD has taught me
categories:
- General
tags: []
status: publish
type: post
published: true
meta:
  draftfeedback_requests: a:1:{s:13:"4f85d53598866";a:3:{s:3:"key";s:13:"4f85d53598866";s:4:"time";s:10:"1334170933";s:7:"user_id";s:7:"5078411";}}
  draft_feedback: "a:1:{s:13:\"4f85d53598866\";a:1:{i:0;a:2:{s:4:\"time\";s:10:\"1334178702\";s:7:\"content\";s:1385:\"Typo\n\nUnder
    It's about communication reads \"why the need that feature\" believe that the
    the should actually be they\n\nFeedback\n\nIn the sections BDD frameworks are
    for higher level,  BDD frameworks are for Customers to use and BDD is not AAA
    at the end of each of these sections you say something like  I'll cover that shortly
    or I'll come back to this later.  Reading this I found the repetition of the similar
    phrase jarring and was left wanting you to explain what you meant at that point.\n\nYou
    mention that you start at the UI and drive specifications or do you start at the
    interactions the UI has? I ask the question as you are likely to get somebody
    say \"you don't test the UI with MSpec\" \n\nYou mention that some frameworks
    making certain things easier and I can see some people wanting examples of this
    (they'll focus on the technical rather than the principles).\n\nI like the article
    and understand entirely what you are saying and to me makes sense, what you are
    describing around the frameworks is the focus on the technology rather than the
    principles, and when people focus on the technology they tend to invest in the
    technology and end up quarrelling when somebody says their particular techology
    isn't the best.\n\nOne other thing you might want to mention is the fact that
    a lot of people focus on the technology i.e. the framework rather than the idea/principle
    behind BDD\";}}}"
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1366805826;}
  _wpas_skip_twitter: '1'
  _wpas_skip_fb: '1'
  _elasticsearch_indexed_on: '2012-04-11 16:16:24'
  twitter_cards_summary_img_size: a:6:{i:0;i:504;i:1;i:187;i:2;i:3;i:3;s:24:"width="504"
    height="187"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
---
Every so often I hear comments such as the one below:
<blockquote>I don't get what BDD offers me over TDD</blockquote>
and it usually is in the context of some framework. I had this happen the other day and like many things that take place on Twitter, it led to more conversations about what BDD is and what it means to different people.
<h3>far from the horse's mouth</h3>
<a href="http://dannorth.net/introducing-bdd/">Dan North coined the term BDD</a> many years ago, and I by no means aim to redefine it. As such, nothing of what I claim here necessarily coincides with Dan's definition. This post is exclusively my own opinion. My only certainty is that he at least somewhat agrees with me on this statement:

<img class="alignnone size-full wp-image-2496" title="dannorth" src="{{ site.image }}/bdd-1.png" alt="" width="504" height="187" />

Dan's paper taught me a few things and confirmed that other things I was doing were on the right track:
<h1>It's about communication</h1>
First and foremost: communication, at all levels.  It is talking to the customer, the business, understanding their needs, asking them why they need that feature, 5 times to make sure they really do. Understanding what exactly the feature is, understanding who it is that needs the feature.

Writing the Story cards in a specific format is about asking the right questions, not having a pretty format on a Kanban board or in a <em>Cucumber </em>test.

Whether your customer is the business owner or a developer, is irrelevant. The only difference is the context changes. Whereby a customer doesn't care about the term exception appearing in a story, but does care about an error page, a developer cares about an exception being part of the text.
<h1>It's about specifications</h1>
The tests I write are about defining the <strong>specification</strong> of the system. They are the <strong>documentation</strong>, they are the contract. As my system updates, so do my tests, my specifications. I make no distinction between a user interface or a call to a message queue. They are all specifications.
<h3>Misconceptions I have seen</h3>
Some things which I feel are misconceptions (or at least what I don't necessarily agree with), and are somewhat putting people on the wrong track:
<h1>BDD is a framework</h1>
Dan came out with JBehave in an attempt to dissociate Test Driven Design with Testing. To make his students focus on using TDD as a means in defining the behavior of the software they were writing, and prevent a continuous focus on testing.

As such, nothing forces people into using a BDD framework, because there really is no such thing. Unfortunately the continuous appearance of more and more so-called "BDD Frameworks" and guidance as the one below, do not help

<img class="alignnone size-full wp-image-2497" title="mocha" src="{{ site.images }}/bdd-2.png" alt="" width="529" height="134" />

Much like BDD is not about frameworks, it is also not about keywords or flavors.
<h1>BDD is for defining system behavior</h1>
Dan emphasizes the word <strong>behavior</strong> and this is also apparent in the naming of the framework JBehave. This often leads to comments of the type:
<blockquote>I use BDD to define more the system's behavior and use TDD for lower level components</blockquote>
Every single part of a system, from the user interface, down to the individual method on a class has behavior. As such, saying one is for defining behavior and another for defining &lt;insert_alternative_to_behavior_here&gt; makes little sense.

Software has specifications. We define specifications.
<h1>BDD is for Business Applications</h1>
Here is a common meme
<blockquote>I use BDD for Business applications. For libraries I use TDD</blockquote>
Assuming that BDD is defining a specification, why is that a library does not require its specification to be defined? Maybe the answer to that question is the next item:
<h1>BDD is too explicit</h1>
<blockquote>BDD frameworks are too explicit. They are too verbose. For Customers this is great, but for developers it's too much to cope with</blockquote>
How is more bad?

Most likely because we <em>assume</em> that developers are smarter, they are more familiar with the domain they are working in. Yes. Every developer has seen a DAL. Every developer has worked with that specific logging component. Every developer has worked with that specific Message queue. They don't expect detailed specification of how the libraries work, they just <em>assume</em> things. There's that word again: <em>assumption</em>.

Everyone agrees that 100% test coverage or all tests green mean nothing. You could have everything working, but have the wrong thing working. The only one that can truly confirm that something is correct is the person asking for it: the consumer.

As such, if we look at a unit test that passes, with no clear description of what the unit does other than the code in it, what have we got to contrast it against? That is why specifying the conditions under which an action takes place, describing the action taking place and defining the expected results serve as a means to verify that the code is doing what the specification is describing.

In Business applications it is true that not all developers are familiar with the domain they work on. However, in software development, where the domain is software, this also holds true. Or you're telling me that you're familiar with ReSharper's PSI subsystem?
<h1>BDD frameworks are for higher level, TDD for lower level components</h1>
This is not only again making a distinction between types of frameworks, but it is also making the assumption that somehow higher level aspects of an application are different than lower level aspects.
<h1>BDD frameworks are for end users to use</h1>
Frameworks such as <em>Cucumber </em>which allow for nicely formatted and descriptive specifications, have led many to believe that customers can end up writing these without the intervention of developers. If communication is key, how can we even begin to imagine that this would be a good idea? Who is there to ask the questions?
<h1>BDD is for Integration Testing, TDD is Unit Testing</h1>
If we accept the term Integration of testing more than one real component of the system at the same time, then BDD is no more of integration test than TDD is depending on the school of thought you follow (i.e. do I mock or do I not mock).
<h1>BDD is GWT, TDD is AAA</h1>
AAA is the typical pattern for unit testing: <strong>Arrange, Act and Assert</strong>, whereby you setup the unit under test, execute the action and verify the result.
<pre>arrange

act

assert</pre>
GWT stands for<strong> Given, When, Then</strong>, which is usually identified with BDD frameworks
<pre>given_a_series_of_conditions

when_I_do_something

then_something_happens</pre>
If you look closely, you can see that there is no real difference between the two. Both are about setting up scenarios, executing and validating. The only difference is one is more explicit.
<h1>TDD is one assert, BDD has more</h1>
There is a spoken rule in Unit Testing that states there should only be one Assert per test. The main reason for this is so that when the test fails, you know where its failed.

There is nothing in the "BDD World" that indicates that a test should have more than one assertion. However, if we consider tests for what they are, which is specification, depending on the level at which we are located, i.e. are we talking about user interaction or method calls, there is a potential for more than one result from an action.

For instance:

<em>when a user tries to log in to a web site with invalid credentials, he/she should receive an error message and the administrator should get notified</em>.

This specification clearly demands two verifications be made.

Applying the same techniques to a method call:

<em>when executing GetCustomerById with an invalid customer, it should return null</em>

only requires one assertion.

Doing this does not necessarily make it harder to detect where a failure is. Some frameworks make this easier than others.  For instance, in MSpec, the above test could look something like the following:
<pre>public class when_user_logs_in_with_invalid_credentials {
  Establish context =&gt; {....}
  Because of =&gt; {...}
  It should_redirect_to_error_page =&gt; { // One assert only }
  It should_notify_administrador =&gt; { // One assert only }
}</pre>
Each verification block (<em>It</em>) usually only has one assertion.
<h1>BDD is outside-in. TDD is inside-out</h1>
From the time it clicked for me that TDD was about writing specifications, I have always taken an outside-in approach when developing systems. I start with the most external "component" which usually is the user interaction (not UI, but what the UI interacts with such as a Controller in a web application) and start driving the specifications from there inwards. From there I specify internal components and so on and so forth. This allows me to have a usage scenario for every component.

The alternative approach (could be called inside-out) is to start driving out individual components of the system and putting them together. However, if TDD is about trying out a component to see if it fits the need, how could this possibly work if we are not basing the prototyping on an real usage scenario?
<h3>Do frameworks really not matter?</h3>
I started this post pointing to the unnecessary divide between TDD/BDD frameworks and have kept repeating that I am against the BDD vs TDD framework distinction, specially considering that I see no distinction between TDD/BDD.

Having said that, some frameworks make certain things easier, such as built-in support for multiple verification blocks (MSpec), nicely formatted printouts that can be used as specifications which can be understood by all people, technical and non-technical (MSpec, Cucumber). Some also have downsides. For instance MSpec doesn't support very well the concept of multiple-input testing.

I normally stick to one framework. If you want to use two, use two, but stop focusing the distinction on TDD vs BDD or on more vs less verbosity.
<h3>what i strive for</h3>
Dan North gave the following definition of BDD in November 2009, in London:
<blockquote>BDD is a second-generation, outside–in, pull-based, multiple-stakeholder, multiple-scale, high-automation, agile methodology. It describes a cycle of interactions with well-defined outputs, resulting in the delivery of working, tested software that matters.
<div></div></blockquote>
Whether what I do fits in with that or not, I'm not too worried about.

What is important for me is that when someone else looks at my project, if it is a business application, they clearly, without having to make any assumptions, understand how things work. When they look at my API specifications, they serve as documentation and live examples of how to use my library.

My concern is to perfect this, and over the years, as I come back to projects I've worked on, I see the mistakes I've made (mostly in the form of assumptions, other times in the form of organization of specifications) and I try and improve it on every new project.

There is no difference between BDD and TDD frameworks because there is no difference between BDD and TDD. It's just doing things right.

And if I got this whole BDD thing wrong, my bad. However,  I'm not chasing an acronym.
