---
layout: post
title: Mocking UserAgent property in ASP.NET MVC with Moq
categories: []
tags:
- ASP.NET MVC
- Unit Testing
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-03-31 06:54:26'
comments: true
---
A question popped up today about someone having trouble mocking the UserAgent property of a Controller. There's enough information on the Internet with solutions to this problem, so I'm going to describe how to figure it out if you don't have an Internet connection.

Let's assume we need to test that our Index action in our HomeController displays the UserAgent information:
<div>
<div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> ActionResult Index()</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     <span style="color:#008000;">// Don't use ViewData at home kids! This is just a demo</span></pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     ViewData[<span style="color:#006080;">"UserAgent"</span>] = Request.UserAgent;</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span></pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>     <span style="color:#0000ff;">return</span> View();</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span> }</pre>
</div>
</div>
Our test would look something like:
<div>
<div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> [TestMethod]</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> Index()</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span> {</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span></pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>     HomeController controller = <span style="color:#0000ff;">new</span> HomeController();</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span></pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>     ViewResult result = controller.Index() <span style="color:#0000ff;">as</span> ViewResult;</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span></pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span>     ViewDataDictionary viewData = result.ViewData;</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  10:</span>     Assert.AreEqual(<span style="color:#006080;">"Mozilla/5.0 ...."</span>, viewData[<span style="color:#006080;">"UserAgent"</span>]);</pre>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  11:</span> }</pre>
</div>
</div>
If we run this, it will fail with an exception, reason being that <strong>Request </strong>is null in our test. This makes sense because we're not coming in from a browser, we're just calling a method on a class. Therefore, what we need to do is somehow inject a fake Request in there with some value assigned to the UserAgent. The problem is how....

<strong>Reflector is your friend</strong>

Now, ASP.NET MVC comes with source code that you can download from Codeplex. Having the source code makes it easy to figure out how things work. But we're assuming that you don't have an Internet connection remember? And you forgot to download the source code. So let's fire up Reflector and see what it shows us.

We open up Reflector and load System.Web.Mvc, and locate the Controller class. Since we're trying to access the Request property of the Controller, that's the first thing we want to look up:

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/1-3/" rel="attachment wp-att-2811"><img class="alignleft size-medium wp-image-2811" alt="1" src="http://hhariri.files.wordpress.com/2009/03/11.png?w=300" height="110" width="300" /></a>

Hmm, it looks like the <em>Request</em> property is really coming from the <em>HttpContext</em> property. Clicking on that gives us:

&nbsp;

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/2-2/" rel="attachment wp-att-2802"><img class="alignleft size-medium wp-image-2802" alt="2" src="http://hhariri.files.wordpress.com/2009/03/2.png?w=300" height="103" width="300" /></a>

We see that the <em>HttpContext </em>is being obtained from the <em>ControllerContext</em>. So let's continue to drill down to <em>ControllerContext</em>:

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/3-2/" rel="attachment wp-att-2803"><img class="alignleft size-medium wp-image-2803" alt="3" src="http://hhariri.files.wordpress.com/2009/03/3.png?w=300" height="44" width="300" /></a>

Aha! Looks like we've reached the end. ControllerContext is a read-write property. This means that if we provide a fake <em>ControllerContext </em>in our test, one that contains a fake HttpContext which in turn contains a fake Request with our UserAgent, we're all set.

&nbsp;

<strong>Working our way backwards</strong>

I'm going to use Moq as my mocking framework, but you can use any other framework, such as RhinoMocks.  Instead of trying to declare a whole bunch of mocks first, in a true TDD fashion let's work our way backwards. First thing we need is a mock <em>ControllerContext. </em>In Moq, the actual mocked object is accessed via the <em>Object </em>property (I'm using screenshots so you can better contemplate the process):

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/4-2/" rel="attachment wp-att-2804"><img class="alignleft size-medium wp-image-2804" alt="4" src="http://hhariri.files.wordpress.com/2009/03/4.png?w=300" height="138" width="300" /></a>

As we can see, we've added a controllerContext mock object and so the next step is to create this object:

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/5-2/" rel="attachment wp-att-2805"><img class="alignleft size-medium wp-image-2805" alt="5" src="http://hhariri.files.wordpress.com/2009/03/5.png?w=300" height="50" width="300" /></a>

Now, our <em>controllerContext</em> needs the <em>HttpContext </em>property set:

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/6-2/" rel="attachment wp-att-2806"><img class="alignleft size-medium wp-image-2806" alt="6" src="http://hhariri.files.wordpress.com/2009/03/6.png?w=300" height="90" width="300" /></a>

The lines boxed in red are what we've added new. Now that we have our mocked <em>ControllerContext</em> and our <em>HttpContext</em>, the only thing left is to setup the <em>UserAgent</em> property of our Request. But to do that, we need another mock, the <em>HttpRequest </em>object:

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/7-2/" rel="attachment wp-att-2807"><img class="alignleft size-medium wp-image-2807" alt="7" src="http://hhariri.files.wordpress.com/2009/03/7.png?w=300" height="85" width="300" /></a>

We therefore create the new mock object and setup the <em>UserAgent </em>property:

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/attachment/8/" rel="attachment wp-att-2808"><img class="alignleft size-medium wp-image-2808" alt="8" src="http://hhariri.files.wordpress.com/2009/03/8.png?w=300" height="64" width="300" /></a>

Our complete test now looks like this:

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/attachment/9/" rel="attachment wp-att-2809"><img class="alignleft size-medium wp-image-2809" alt="9" src="http://hhariri.files.wordpress.com/2009/03/9.png?w=300" height="164" width="300" /></a>

And running it should give us a successful pass!

<strong>Refactoring</strong>

Now that we've understood exactly what's required, let's see if we can clean up the test a bit:

<a href="http://hadihariri.com/2009/03/31/mocking-useragent-property-in-asp-net-mvc-with-moq/attachment/10/" rel="attachment wp-att-2810"><img class="alignleft size-medium wp-image-2810" alt="10" src="http://hhariri.files.wordpress.com/2009/03/10.png?w=300" height="108" width="300" /></a>

See what's happened? We've removed the mock objects for both the <em>HttpRequest </em>and the <em>HttpContext. </em>The reason we can do this is because of how Moq works, creating proxies for reference types. Therefore, <em>HttpContext </em>is actually not null, and nor is <em>Request</em> even though we haven't specifically created a mock for them. This allows us to easily access the <em>UserAgent </em>property and set it to the value required. Saves quite a bit of code

<strong>Summary</strong>

Mocking can sometimes seem complicated, not knowing what you're meant to do to get something to work. But all you need to do is take a step back, analyze what is it you're trying to mock and work your way up. Having tools like Reflector make this easier!
