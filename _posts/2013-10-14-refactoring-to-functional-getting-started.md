---
layout: post
title: Refactoring to Functional–Getting Started
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
  draftfeedback_requests: a:1:{s:13:"525ae6c4d104e";a:3:{s:3:"key";s:13:"525ae6c4d104e";s:4:"time";s:10:"1381689028";s:7:"user_id";s:7:"5078411";}}
  _publicize_pending: '1'
  _elasticsearch_indexed_on: '2013-10-13 22:00:48'
---
This is a multi-part series on Refactoring to Functional Programming
<ol>
	<li>Getting Started</li>
	<li><a href="http://hadihariri.com/2013/11/09/refactoring-to-functional-basic-primitives">Basic Primitives</a></li>
	<li><a href="http://hadihariri.com/2013/11/18/refactoring-to-functional-reducing-and-flattening-lists/">Reducing and Flattening Lists</a></li>
	<li><a href="http://hadihariri.com/2013/11/24/refactoring-to-functionalwhy-class/">Why Class?</a></li>
</ol>
<span style="color:#444444;line-height:1.7142;">It’s high-time I improve my functional programming skills, and like </span><a style="line-height:1.7142;" href="http://codeofrob.com/entries/learn-functional-programming-with-me---but-rob,-it-needs-to-be-more-composable.html" target="_blank">my fellow countryman</a><span style="color:#444444;line-height:1.7142;">*, I’ll do it in the open. Different to Rob though, I’m going to use Kotlin, not Clojure. Reasons are:</span>
<ul>
	<li>I'm loving the language and am mostly comfortable with it.</li>
	<li>I feel it’s a good stepping stone as it provides familiarity, allowing me to focus on functional paradigms.</li>
	<li>Kotlin claims to have functional aspects. I’m hoping to prove this right.</li>
	<li>It fits in nicely with my job.</li>
</ul>
and most importantly, because I want to.

In a series of posts, I'll try and look at ways of solving problems using a functional approach as opposed to an imperative one. I’m not a big fan of blog post series, primarily because they require some sort of structure and planning, but this is an ongoing process and I’m not going to wait till the end to write about it. And while a certain level of structure will go into these posts, I can’t commit to how it will pan out so we’ll just pretend it’s not a series.

I want to give up-front credit to <a title="https://twitter.com/jhusain" href="https://twitter.com/jhusain">@jhusain</a> as some of the ideas and exercises will be based on his <a href="https://github.com/jhusain/learnrx">LearnRX</a> project as well as my friend <a href="http://twitter.com/RobAshton">Rob</a> whose brain I pick, and will continue to pick with my functional insecurities. Last but not least also thanks to <a href="http://twitter.com/abreslav">Andrey</a>, who’ll undoubtedly (he doesn’t know yet) will end up doing some reviews.
<h2>Functional Programming</h2>
Wikipedia defines Functional Programming as
<blockquote>In computer science, functional programming is a programming paradigm, a style of building the structure and elements of computer programs, that treats computation as the evaluation of mathematical functions and <strong>avoids state and mutable data</strong>. Functional programming <strong>emphasizes functions</strong> that produce results that depend only on their inputs and not on the program state - i.e. pure mathematical functions. It is a declarative programming paradigm, which means programming is done with expressions.</blockquote>
<span style="line-height:1.714285714;color:#444444;font-size:1rem;">The key ideas to keep in mind when doing functional programming are:</span>
<ol>
	<li><strong>Everything is a function</strong>
As such we need to stop thinking about objects, classes, etc. other than for returning data or interop with the platform.</li>
	<li><strong>Functions should be pure
</strong>A pure function should always return the same output given the same input and should not depend on anything that is not directly the input (i.e. external data). It should also not cause any side-effects.</li>
	<li><strong>We shouldn't maintain state
</strong>Shared state is the root of all evil. Or so they say. In any case, if we can’t really depend on state according to point 2, then why maintain it.</li>
	<li><strong>We should consider input infinite
</strong>Apparently it’s better, specially if we combine it with lazy evaluation. We’ll see the benefits at some point. Or at least I hope we do.</li>
</ol>
<h2>Benefits of Functional Programming</h2>
Seems there are many benefits to functional programming, including the ability to achieve concurrency more easily as state is not maintained, writing more concise code, and solving some problems which using OO paradigms might not be so straightforward.

But that’s what they say. I want to find out for myself. So until then, I’m going to take it all with a pinch of salt. Worse that can happen is that I end up looking at approaching problems in a different way, and that for me, is definitely a win.

We’ll see…
<h2>Kotlin as a functional language</h2>
Although Kotlin is far from being a purely functional language, it does have support for functions as first-class citizens and also allows for creating immutable data, so in principle it should suit our needs. If you're coming from a Java or C# background, you’ll have little trouble getting used to Kotlin’s syntax. I already covered the <a href="http://hadihariri.com/2012/02/17/the-kotlin-journey-part-i-getting-things-set-up/">basics of Kotlin in a four part series</a> and while there have been some changes to the language, much of it remains the same. If you want to follow this series, you can use any flavor of <a href="http://www.jetbrains.com/idea">IntelliJ</a> or use the <a href="https://github.com/JetBrains/kotlin/releases/download/build-0.6.602/kotlin-compiler-0.6.602.zip">command line compiler</a> with your <a href="http://www.vim.org/">favorite editor</a>. But for heavens sake, if you choose the latter, let me not catch you using cursor keys.
<h3>Top-Level Functions</h3>
In Kotlin you can have a file and in the file declare any number of functions, much like you can with JavaScript. There’s no need for a static class or object. We can simply do something like

{% highlight kotlin %}
fun isValidAccount(accountNumber: String): Boolean {
   // function logic
}
{% endhighlight %}

This function sits standalone, declared as part of a package, and can be used anywhere where the corresponding package is imported.
<h3>Immutable Data and Common Data Structures</h3>
Kotlin has shorthand for declaring properties on a class, be it a regular class or a data class (i.e. a DTO). When declaring properties we can either make them mutable (<em>var</em>) or immutable (<em>val</em>). To declare a data class with three immutable properties we could do

{% highlight kotlin %}
data class Customer(val name: String, val email: String, val country: String)
{% endhighlight %}

In addition to creating immutable data types, functional languages such as Clojure use a series of common well-known data structures, namely vectors, lists and maps, all of which are available in Kotlin and we’ll be using.

Until next time.
<h2></h2>
<em>* I was born in Iran, raised in the UK till I was 10, and living in Spain ever since. Rob as far as I know was born and raised in the <del>UK</del> Isle of Man. Yet I feel a bond. Maybe it’s the Stilton cheese.</em>
