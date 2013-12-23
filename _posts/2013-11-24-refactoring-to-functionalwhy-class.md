---
layout: post
title: Refactoring to Functional–Why Class?
categories:
- General
- JetBrains
tags:
- Functional Programming
- Kotlin
status: publish
type: post
published: true
meta:
  _publicize_pending: '1'
  _elasticsearch_indexed_on: '2013-11-24 16:08:26'
---
This is a multi-part series on Refactoring to Functional Programming
<ol>
	<li><a href="http://hadihariri.com/2013/10/14/refactoring-to-functional-getting-started/">Getting Started</a></li>
	<li><a href="http://hadihariri.com/2013/11/09/refactoring-to-functional-basic-primitives/">Basic Primitives</a></li>
	<li><a href="http://hadihariri.com/2013/11/18/refactoring-to-functional-reducing-and-flattening-lists/">Reducing and Flattening Lists</a></li>
	<li>Why Class?</li>
</ol>
<h3>In College</h3>
<strong>Teacher</strong><em>:</em> We are surrounded by objects in the real world. These can be cars, houses, etc. That’s why it’s very easy to associate real world objects with classes in Object Oriented Programming.
<h3>2 weeks later</h3>
<strong>Jake</strong><em>:</em> I’m having a bit of hard time with these objects. Can you give me some guidance?

<strong>Teacher</strong><em>:</em> Sure. There’s actually a couple of more or less formal processes to help you, but to sum it up, look for nouns. And verbs are like methods that can be performed on the class. The behavior so to speak.

<strong>Jake</strong><em>:</em> Well that seems reasonable. Thanks!

Jake graduates.
<h3>Jake’s on the job</h3>
<strong>Phil</strong>: Hey Jake. I’ve been looking at this class of yours. It’s a little bit too big.

<strong>Jake</strong>: Sorry. And what’s the issue with that?

<strong>Phil</strong>: Well, thing is. It’s got too many responsibilities. It does too much.

<strong>Jake</strong>: And?

<strong>Phil</strong>: Well think about it. If it does too much, it means that it touches many parts of the system. So the probability of having to touch the class when changing code is higher, which means more probability of breaking things. Plus, 1000 lines of code in a single class is harder to understand than 30 lines.

<strong>Jake</strong>: Yeah. Makes sense.

<strong>Phil</strong>: Break these up into smaller classes. That way each class does only one thing and one thing alone.
<h3><strong>A year later</strong></h3>
<strong>Mary</strong><em>:</em> Jake, I’m just reviewing this class of yours, there’s not much behavior in it.

<strong>Jake</strong><em>:</em> Yeah well I wasn’t sure if that behavior belonged in the <em>Customer</em> class or to the <em>Accounts</em> class, so I placed it in this other class called <em>CustomerService</em>.

<strong>Mary<em>:</em></strong> OK. Fair enough. But the <i>Customer </i>class isn’t really a class anymore. It’s more a DTO.

<strong>Jake</strong>: DTO?

<strong>Mary</strong>: Yes, a Data Transfer Object. It’s like a class but without behavior.

<strong>Jake</strong>: So like a structure? A record?

<strong>Mary</strong>: Yes. Kind of. So just make sure your classes have behavior. Otherwise, they’re not really classes. They’re DTO’s.

<strong>Jake</strong>: OK.
<h3><strong>2 years later</strong></h3>
<strong>Mathew</strong>: Jake, looking at this class. It’s tightly coupled to a specific implementation.

<strong>Jake</strong>: Huh?

<strong>Mathew</strong>: Well, you’re creating an instance of <em>Repository</em> inside the <em>Controller</em>. How you going to test it?

<strong>Jake</strong>: Hmm. Fire up a demo database?

<strong>Mathew</strong>: No. What you need to do is first off, program to an interface not a class. That way you don’t depend on a specific implementation. Then, you need to use Dependency Injection to pass in a specific implementation, so that when you want to change the implementation you can.

<strong>Jake</strong>: Makes sense.

<strong>Mathew</strong>: And in production, you can use an IoC Container to wire up all instances of the different classes.
<h3>3 years later</h3>
<strong>Francis</strong>: Jake. You’re passing in too many dependencies into this class.

<strong>Jake</strong>: Yeah but the IoC Container handles that.

<strong>Francis</strong>: Yes. I know but just because it does, it doesn’t make it right. Your class is still tightly coupled to too many other classes (even though the implementations can vary). Try and keep it to 1 to 3 maximum.

<strong>Jake</strong>: OK. Makes sense. Thanks.
<h3>4 years later</h3>
<strong>Anna</strong>: Jake. This class, why did you name it <em>Utils</em>?

<strong>Jake</strong>: Well. I didn’t really know where to place that stuff cause I don’t know where it really belongs.

<strong>Anna</strong>: OK. It’s just that we already have a class for that. It’s called <em>RandomStuff</em>
<h3><strong>Over a beer…</strong></h3>
<strong>Jake</strong>: You know Pete, I’ve been thinking. They teach us that we need to think in terms of objects and identify these with nouns among other techniques. We then need to make sure that we name them correctly, that they’re small, that they only have a single responsibility and that they can’t have too many dependencies injected into them. And now they’re telling us that we should try and not maintain state because it’s bad for concurrency. I’m beginning to wonder, why the hell have classes at all?

<strong>Pete</strong>: Don’t be silly Jake. Where else are you going to put functions if you don’t have classes?

<strong>Pete:</strong> Another beer?

Until next time.
