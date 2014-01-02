---
layout: post
title: var improves readability
categories: []
tags:
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-11-20 07:11:00'
comments: true
---
<p>
&nbsp;
</p>

<p>
Countless times I&rsquo;ve heard the argument that you should use the <strong>var </strong>keyword with caution, that it decreases readability of your code, or <a href="http://weblogs.asp.net/stevewellens/archive/2009/11/19/can-the-c-var-keyword-be-misused.aspx">how it can be misused</a>.
</p>

<p>
The example given in the linked post is:
</p>

<pre class="csharpcode">
    var Data = GetData();
</pre>
<p>
&nbsp;
</p>
<p>
According to the blog post, <em>GetData </em>returns a <em>DataTable</em>, something not inherently apparent. The problem however is due to the naming conventions used by the developer.
</p>
<p>
Firstly, <em>GetData </em>is a method indicating that it returns Data. The problem is, pretty much anything is Data. There has to be a more precise definition of what it is the method is actually doing. By this, I don&rsquo;t mean you should necessarily rename the method to <em>GetDataTable</em>, since this doesn&rsquo;t help. This just indicates what type it is returning, not what the method is doing. It would be an appropriate name if the domain of the problem were somehow about types, but in a business scenario, it doesn&rsquo;t provide much value.
</p>
<p>
The second issue and just as important, is the variable name, <em>data</em>. Again, it is not descriptive enough. What is <em>data</em>? What kind of information does it hold? Is it a <em>car</em>? Is it many <em>cars</em>?
</p>
<p>
By using var, you are forcing yourself to think more about how you name methods and variables, instead of relying on the type system to improve readability, something that is more an implementation detail. Using the var keyword is not about being lazy, quite the contrary.
</p>
