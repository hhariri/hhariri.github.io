---
layout: post
title: Old School Delphi, Agile is a buzzword?
categories: []
tags:
- Design
- Unit Testing
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-09-13 09:13:00'
comments: true
---
<p>I was reading a comment in reply to <a href="http://delphixtreme.com/wordpress/?p=22">this post</a> on DelphiExtreme, by <em>Ken Knopfli</em>, and I quote:</p>  <blockquote>	   	<p>	Delphi programmers tend to be old experienced hands, have seen it all before, and can see hype for what it is.	</p>	    	<p>	Most of us have years of experience and have developed our own way of working. A young chap here is a big fan of D/NUnit and now we have two people that do nothing but create and maintain unit tests. Uh huh.	</p>	    	<p>	My customers want results and don&rsquo;t care if I am &ldquo;behind the times&quot;.	</p>	 </blockquote>  <p>I think it&#039;s sad and wrong to think like that. We&#039;ve all used RAD tools for many years, be it Delphi, Visual Basic or Visual Studio. Used like <em>demoware </em>they have one fundamental flaw, they create unmaintainable solutions in more ways than one. Agile practices, among other things, are about trying to prevent that. </p>  <p>Unit testing is not only about testing your code in isolation. It&#039;s about regression testing. Creating unit tests allows you to test your code anytime you introduce a change, be it a bug fix, be it a new feature. Unit Testing is about documentation. It&#039;s about letting a new member of your team understand the specs of the application one step at a time. Unit test can be and many times is (TDD) about design. </p>  <p>Separation of concerns, single responsibility, loose coupling are not buzzwords. They are fundamental design principles that can save you in the long and short term. </p>  <p>In reference to Lex&#039;s comment, I&#039;ll be doing talks both at <a href="http://www.sdc.nl">SDC</a> and at <a href="http://entwicklerkonferenz.de">EKon</a> (European CodeGear) about these topics, so if you&#039;re in Europe and interested, might be worthwhile coming. In any case, these are principles that can be taught irrelevant of the language, be it Delphi, C#, Lisp or Smalltalk. It&#039;s about good object orientated programming, it&#039;s not about a platform or an environment. Let&#039;s stop being the children of the drag&#039;n&#039;drop era. </p>
