---
layout: post
title: Additional code just for testing
categories: []
tags:
- Design
- Unit Testing
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-02-08 12:07:00'
---
<p>
Take a look at this code:
</p>

<p>
&nbsp;
</p>

<div>

<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">

<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> ClassToTest {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> MethodToTest()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>     {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>         IDAL dal = <span style="color:#0000ff;">new</span> DAL();
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>         <span style="color:#0000ff;">int</span> discount = dal.GetDiscount();
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>         <span style="color:#0000ff;">if</span> (discount &gt; 10)
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>         {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>             <span style="color:#008000;">// Do something</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>         }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span>     }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  16:</span> }
</pre>
</div>
</div>
<p>
The tight coupling to DAL just stands out like a sore thumb. One consequence of this tight coupling is that it&#039;s hard to test if we don&#039;t have an underlying database setup with correct values. Forget about testing this while taking a shower, unless you have a habit of taking your SQL Server box to the bath tub with you.
</p>
<p>
Take a look at the following approach to making this code testable without having a database:
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> ClassToTest {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> MethodToTest()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>     {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>         DAL dal = <span style="color:#0000ff;">new</span> DAL();
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>         <span style="color:#cc6633;">#if</span> testing_in_shower
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>         <span style="color:#0000ff;">int</span> discount = 3;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>         <span style="color:#cc6633;">#else</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>         <span style="color:#0000ff;">int</span> discount = dal.GetDiscount();
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>         <span style="color:#cc6633;">#endif</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>         <span style="color:#0000ff;">if</span> (discount &gt; 10)
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>         {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span>             <span style="color:#008000;">// Do something</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  16:</span>         }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  17:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  18:</span>     }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  19:</span> }
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
Are you still here? Didn&#039;t you just fall off of your chair, not knowing whether to laugh or cry in anguish? It&#039;s just plain wrong isn&#039;t it? <em>Code Smell</em> just takes on a whole new dimension (and consistency?). Something like this shouldn&#039;t be done for many reasons. It makes our code testable but it&#039;s wrong.
</p>
<p>
&nbsp;
</p>
<p>
<strong>Introducing code for testing purposes</strong>
</p>
<p>
The reason I bring this up now is because in the past 2 weeks I&#039;ve seen a few references and examples of introducing code just for the sake of testability. Two weeks ago I was skimming over an article that was explaining unit tests. The class the author was trying to test had a dependency that was causing issues during his tests. The solution offered was to introduce a new constructor and inject the dependency in. In our case, the ClassToTest would like:
</p>
<p>
&nbsp;
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> ClassToTest {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">public</span> ClassToTest()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>     {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>         <span style="color:#008000;">// Initialize some stuff</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>     }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>     <span style="color:#0000ff;">public</span> ClassToTest(IDAL dal)
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>     {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>         <span style="color:#008000;">// Initialize some stuff</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>         _dal = dal;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>     }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  16:</span> ....
</pre>
</div>
</div>
<p>
Now that&#039;s great. The problem is that the author left both constructors in there, emphasizing that one is for testing purposes and the other for production code. Why that&#039;s wrong I&#039;ll get to in a moment.
</p>
<p>
The other day, Scott Hansleman made a <a href="http://www.hanselman.com/blog/IPrincipalUserModelBinderInASPNETMVCForEasierTesting.aspx">blog post</a> on testing some code that had a dependency on the current principal. His solution was to inject IPrincipal into various methods of the Controller, where Controller is in the context of an ASP.NET MVC Controller. Personally I don&#039;t agree with the solution but that&#039;s another subject (and another post on a different approach I have in the backlog for the same scenario). However, injecting the dependency seemed valid enough. Later on he updated the post with the following:
</p>
<p>
&nbsp;
</p>
<blockquote>
	<p>
	<strong>UPDATE: </strong>Phil had an interesting idea. He said, why not make method overloads, one for testing and one for without. I can see how this might be controversial, but it&#039;s very pragmatic.
	</p>
	<ol>
		<li>[Authorize]&nbsp; </li>
		<li>public ActionResult Edit(int id)&nbsp; </li>
		<li>{&nbsp; </li>
		<li>return Edit(id, User); //This one uses HttpContext</li>
		<li>}&nbsp; </li>
	</ol>
	<pre>
	[Authorize]
	public ActionResult Edit(int id)
	{
	return Edit(id, User); //This one uses HttpContext
	}
	</pre>
	<p>
	You&#039;d use this one as before at runtime, and call the overload that takes the IPrincipal explicitly for testing.
	</p>
</blockquote>
<p>
The same thing has happened as in the case of an overloaded constructor. Code has been introduced into the base just for the sake of testability. In the previous case it was a new constructor, and in this case, a new method.
</p>
<p>
&nbsp;
</p>
<p>
<strong>Why is this wrong?</strong>
</p>
<p>
Introducing code just so that you can test it is wrong for several reasons, including an increase in noise, decrease in readability and more importantly, permitting the possibility of production code that will not be tested. It might seem improbable at first, seeing that the overloaded versions always call the base ones, but as your code base grows, by allowing this habit, you can promote it to other structures such as conditionals, switch statements, etc, and not limit it only to methods or constructors. Then you&#039;ll start initializing values that only make sense in tests and gradually your code starts to smell more and more. To top it off, you can throw in some compiler conditional that rips those parts of the code out from the production version.
</p>
<p>
Code should also serve as documentation. The cleaner you make your code, the less noise and redundancy you add, the easier it is for others to understand and maintain.
</p>
<p>
&nbsp;
</p>
<p>
<strong>Conclusion</strong>
</p>
<p>
Being pragmatic is good, but don&#039;t do it at any cost. Try and not introduce code into your code base that is there exclusively for the purpose of testability (and no, dependency injection is not only for testability). Anything that has to do with testing, keep it where it should be, in the test assemblies. Having overloaded methods or constructors, mocks or stubs in your code base is just as bad as having compiler conditionals in your code for testability. If you run into issue where your code is hard to test, step back and re-think your design. Maybe the problem you&#039;re facing now that&#039;s impeding your tests is actually a can of worms waiting to be opened. And the sooner you open it, the better. That&#039;s one of the great advantages of Test Driven Development.
</p>
