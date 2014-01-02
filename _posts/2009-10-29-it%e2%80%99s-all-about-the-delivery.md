---
layout: post
title: It’s all about the delivery
categories: []
tags:
- Process
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-10-29 20:31:00'
comments: true
---
<p>
<br />
The Dependency Inversion Principle states:
</p>
<p>
&nbsp;
</p>
<dl><dd><dl><dd><em>A. High-level modules should not depend on low-level modules. Both should depend on abstractions.</em></dd><dd><em>B. Abstractions should not depend upon details. Details should depend upon abstractions.</em></dd></dl></dd></dl>    <br />
(Source WikiPedia).
<p>
&nbsp;
</p>
<p>
<a href="http://www.codinghorror.com/blog/archives/001225.html">Throw that at a terrible programmer</a>, and all you&rsquo;ll get is a terrible programmer that is annoyed and hates you. So true!
</p>
<p>
Take the following method:
</p>
<div class="csharpcode">
<pre class="alt">
        <span class="kwrd">public</span> <span class="kwrd">void</span> PrintHelloMessage()
</pre>
<pre>
        {
</pre>
<pre class="alt">
            Console.WriteLine(<span class="str">&quot;Hello&quot;</span>);
</pre>
<pre>
        }
</pre>
</div>
Now ask a developer to add a new method to print the message &lsquo;Goodbye&rsquo;. Do you think he would do:
<pre class="csharpcode">
        <span class="kwrd">public</span> <span class="kwrd">void</span> PrintGoodbyeMessage()
{
Console.WriteLine(<span class="str">&quot;Goodbye&quot;</span>);
}
</pre>
<p>
<br />
or:
</p>
        <span class="kwrd">public</span> <span class="kwrd">void</span> PrintMessage(<span class="kwrd">string</span> message)<br />
<pre class="csharpcode">
{
Console.WriteLine(message);
}
</pre>
Most likely, he&rsquo;d do the latter. Why? Because he realizes he&rsquo;s gaining a benefit by passing a parameter to a method. He knows that if tomorrow you ask him for a &ldquo;Good Afternoon&rdquo; message, he won&rsquo;t have to write a new method.
<p>
What is Dependency Injection? It&rsquo;s one way of complying with the Dependency Inversion Principle. However, when you think about it, what does it boil down to? Passing a parameter to a method, which happens to be a constructor. It seems simple enough doesn&rsquo;t it? Yet, it&rsquo;s hard for people to understand it. Why? because they don&rsquo;t see the value in it.
</p>
<p>
Explaining a principle to someone without them understanding the benefits and values they get out of it is useless, and that is why concepts such as Dependency Injection or Inversion of Control seem overly complex to the vast majority of developers (believe it or not, those of us that use these things are still a very big minority). It&rsquo;s complex because they haven&rsquo;t been explained the values of it. They&rsquo;ve just been thrown some definition and they are expected to understand that it&rsquo;s bad for one class to create an instance of another class it uses.
</p>
<p>
Present a developer with the following code:
</p>
<div class="csharpcode">
<pre class="alt">
    <span class="kwrd">public</span> <span class="kwrd">class</span> AuthServices
</pre>
<pre>
    {
</pre>
<pre class="alt">
        <span class="kwrd">public</span> <span class="kwrd">void</span> AuthUser(<span class="kwrd">string</span> username, <span class="kwrd">string</span> password)
</pre>
<pre>
        {
</pre>
<pre class="alt">
            var authDAL = <span class="kwrd">new</span> AuthDAL();
</pre>
<pre>
&nbsp;
</pre>
<pre class="alt">
            var user = authDAL.GetUserByUsername(username);
</pre>
<pre>
&nbsp;
</pre>
<pre class="alt">
            <span class="kwrd">if</span> (user != <span class="kwrd">null</span>)
</pre>
<pre>
            {
</pre>
<pre class="alt">
                <span class="kwrd">if</span> ...
</pre>
<pre>
            }
</pre>
<pre class="alt">
&nbsp;
</pre>
<pre>
        }
</pre>
<pre class="alt">
    }
</pre>
</div>
and ask them how they&rsquo;d go about testing this code without having access to a database. Ask them how they&rsquo;d go about changing AuthDAL for some fake DAL that doesn&rsquo;t really connect to a database.
<p>
They&rsquo;ll probably come up with the solution of passing the AuthDAL class in as a parameter, and eventually realizing that multiple methods will use the same class, they&rsquo;ll pass it in via the constructor and set it as an instance field. As long as their AuthDAL has virtual methods, they can create any fake DAL that overrides those methods and returns some dummy value. They might argue that they don&rsquo;t want virtual methods. And that&rsquo;s fine. Tell them to define the parameter as an interface. In fact, they probably have already heard of a principle that says that you should program to an interface and not a class. They&rsquo;ll eventually end up with this code:
</p>
<pre class="csharpcode">
  <span class="kwrd">public</span> <span class="kwrd">class</span> AuthServices
{
IAuthDAL authDAL;
<span class="kwrd">public</span> AuthServices(IAuthDAL authDAL)
{
_authDAL = authDAL;
}
<span class="kwrd">public</span> <span class="kwrd">void</span> AuthUser(<span class="kwrd">string</span> username, <span class="kwrd">string</span> password)
{
var user = _authDAL.GetUserByUsername(username);
<span class="kwrd">if</span> (user != <span class="kwrd">null</span>)
{
<span class="kwrd">if</span> ...
}
}
}
</pre>
&nbsp;
<p>
And voila! You have Dependency Injection via Constructor.
</p>
<p>
Once they *get* that, then explain to them other benefits, you know the real benefits they get from doing this: decoupled code, easy maintenance, promotion of SRP, etc.&nbsp; and then throw the principle in their face:
</p>
<p>
&nbsp;
</p>
<dl><dd><dl><dd><em>A. High-level modules should not depend on low-level modules. Both should depend on abstractions.</em> </dd><dd><em>B. Abstractions should not depend upon details. Details should depend upon abstractions.</em></dd></dl></dd></dl>
<p>
&nbsp;
</p>
<p>
And they&rsquo;ll see how it all makes sense.
</p>
<p>
It&rsquo;s not about throwing or not throwing books. It&rsquo;s about showing people how something can help them, how they get value of it.
</p>
