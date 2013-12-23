---
layout: post
title: Naming tests, once again
categories: []
tags: []
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-09-20 07:32:14'
---
<p>I'm coming across a lot of tests with names like this:</p>  <p><em>AddEmployee_Should_<strong><font color="#ff0000">Pass</font></strong>_When_Not_Duplicate() {.....}</em></p>  <p><em>AddEmployee_Should_<font color="#ff0000"><strong>Fail</strong></font>_When_Duplicate() {....}</em></p>  <p>For the purpose of this post, I don't care about anything other than what's in bold and red. </p>  <p>The word <em>Pass </em>in there is completely irrelevant and useless. The word <em>Fail </em>is just mind-blowing. What should fail? The test? What if the test passes? Does that mean it has really failed? Or when it fails it means it passes? </p>  <p>Now we all know what <em>Fail </em>means here. It means the test will pass but the call will fail. But it doesn't indicate to us what failure consists of and therefore it's not adding information. Someone looking at the <a href="http://www.hadihariri.com/blogengine/post/2008/08/28/Naming-tests.aspx">test cannot validate it</a>. </p>  <p>When naming, indicate what the test is trying to validate, not what the outcome is; the outcome is already known: <strong>pass </strong>or <strong>failure</strong>. </p>  <p>Something along the lines of <em>Add_Employee_Should_Throw_Exception_When_Employee_Already_Exists</em> would add substantial information for the person reading your test to validate the functionality. But more importantly, when the test fails, they would know what has failed and have valuable information for debugging.&#160; </p>
