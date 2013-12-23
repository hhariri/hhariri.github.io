---
layout: post
title: Testing Model Validations?
categories: []
tags:
- Architecture
- ASP.NET MVC
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-10-09 08:09:56'
---
<p>&#160;</p>  <p>ASP.NET MVC 2 allows you to do data validation, either using the de-facto Data Annotations or plugging in your own, much in the same way xVal work. If you’re interested in seeing how that works, take a look at <a href="http://hadihariri.com/blogengine/post/2009/10/06/Client-Side-Validation-in-MVC-20.aspx">this post</a>. </p>  <p>This post however concerns testing. Here’s some code:</p>  <div class="csharpcode">   <pre class="alt">[AcceptVerbs(HttpVerbs.Post)]</pre>

  <pre><span class="kwrd">public</span> ActionResult Create(Customer customer)</pre>

  <pre class="alt">{</pre>

  <pre>    <span class="kwrd">if</span> (ModelState.IsValid)</pre>

  <pre class="alt">    {</pre>

  <pre>    <span class="kwrd">return</span> RedirectToAction(<span class="str">&quot;Index&quot;</span>);</pre>

  <pre class="alt">    }</pre>

  <pre>    <span class="kwrd">return</span> View(customer);</pre>

  <pre class="alt">}</pre>
</div>

<p>
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</p>

<p>This code checks to see if my model is valid. If it is, it then saves it (not in the code) and redirects to the index action, thus producing a RedirectToActionResult. If it is not valid, it will return a ViewResult. Here’s the model:</p>

<div class="csharpcode">
  <pre class="alt"><span class="kwrd">public</span> <span class="kwrd">class</span> Customer</pre>

  <pre>{</pre>

  <pre class="alt">    [Required]</pre>

  <pre>    <span class="kwrd">public</span> <span class="kwrd">string</span> FirstName { get; set; }</pre>

  <pre class="alt">    [Required]</pre>

  <pre>    <span class="kwrd">public</span> <span class="kwrd">string</span> LastName { get; set; }</pre>

  <pre class="alt">}</pre>
</div>

<p>
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</p>

<p>Given the previous, what would you expect the following test to do? Pass or fail?</p>

<div class="csharpcode">
  <pre class="alt">    [Fact]</pre>

  <pre>    <span class="kwrd">public</span> <span class="kwrd">void</span> wont_give_you_any_hints()</pre>

  <pre class="alt">    {</pre>

  <pre>    var controller = <span class="kwrd">new</span> CustomerController();</pre>

  <pre class="alt">&#160;</pre>

  <pre>    var customer = <span class="kwrd">new</span> Customer();</pre>

  <pre class="alt">&#160;</pre>

  <pre>    customer.FirstName = <span class="str">&quot;Jak a.k.a. Casey&quot;</span>;</pre>

  <pre class="alt">    customer.LastName = String.Empty;</pre>

  <pre>&#160;</pre>

  <pre class="alt">    var result = controller.Create(customer);</pre>

  <pre>&#160;</pre>

  <pre class="alt">    Assert.IsType(<span class="kwrd">typeof</span>(ViewResult), result);</pre>

  <pre>    }</pre>
</div>

<p>
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</p>

<p>I’ll give you a hint. It fails. Now I understand why it fails. My problem however is that for me to test my model is valid is going to force me to change the way I have to write my code, and potentially make it less readable.</p>
