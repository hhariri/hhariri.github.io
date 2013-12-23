---
layout: post
title: Always room for improvement
categories: []
tags:
- Process
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-03-08 19:17:00'
---
<p>
As if what Alt.NET is or isn&#039;t, whether it&#039;s <a href="http://www.lostechies.com/blogs/chad_myers/archive/2009/03/01/alt-net-mean-how-do-we-fix-it.aspx">mean</a> or not, wasn&#039;t enough, now we have a new guy on the <a href="http://manifesto.softwarecraftsmanship.org/">scene</a>, and already the <a href="http://serialseb.blogspot.com/2009/03/why-im-not-signing-software.html">first reactions</a> on the blogsphere (not to mention mailing lists and twitter world).
</p>
<p>
Well before I give you my opinion, let me ask a couple of questions:
</p>
<p>
Have you <strong>always</strong> written applications that have been bug free?
</p>
<p>
Have you <strong>always </strong>written applications that were a breeze to change and changes would not introduce new bugs?
</p>
<p>
Have you <strong>always </strong>written applications were the code was easy to understand after not looking at it for 6 months or for a newcomer to the team?
</p>
<p>
&nbsp;
</p>
<p>
I haven&#039;t. I&#039;ve worked on applications were I used to not sleep a day before a new deployment, not knowing whether those last minute changes broke something. I&#039;ve picked up applications that took me weeks to figure out. I&#039;ve been on projects of 7+ people were the bus number has been as low as 1, both as a developer and as a stake holder. I&#039;ve learnt from my errors and I am continuously trying to improve the way I develop software to avoid making the same mistakes I&#039;ve made in the past.
</p>
<p>
Unit testing, Test Driven Development, Dependency Inversion, Single Responsibility aren&#039;t required to make your software work. You don&#039;t need them to deliver applications. Your applications will still work without them. You can still link business logic to partial classes of datasets or hook them up directly to code-behind files in your ASPX pages. You can still use databinding with ObjectDataSources and your application will still work. You can still ship software that will work well for millions of hours with hundreds of thousands of users connected to it.
</p>
<p>
However, I&#039;m quite certain that you&#039;ll suffer the consequences. I&#039;m pretty sure, having been on both sides of the fence, that it will be easier to make a change to an application where you have a clear separation of concerns as opposed to the drag-and-drop version. It will be more re-assuring to make a change and have 90% of your unit tests pass, fix the remaining 10% and then deploy, as opposed to just ship and hope for the best.
</p>
<p>
That&#039;s why I write unit tests, to try and catch as many bugs that I introduce when making changes to existing software. That&#039;s why I apply principles such as SOLID, to make my code easier to change and more understandable
</p>
<p>
Alt.Net or the recent manifesto of <a href="http://manifesto.softwarecraftsmanship.org/">Software Craftsmanship</a> for me represent ways to improve my job and myself. Ways to develop software that will make it easier for me. At the end of the day, what I care about is what I&#039;m responsible for, and that is myself, my team and the software I write. It&#039;s not about making a statement or trying to change the world. Another matter is if I choose to share my experiences with others, which I&#039;m free to do. But it&#039;s not about forcing one way over the other.
</p>
<p>
Maybe the ways that I&#039;ve learnt to improve up to now are not entirely correct. Maybe tomorrow we&#039;ll find better ways to write software, to make our life easier. However, I know that what I&#039;m doing today is better than what I did yesterday. But that can only be accomplished if I&#039;m willing to accept that I<strong> don&#039;t </strong>know it all and I&#039;m open to improvement.
</p>
