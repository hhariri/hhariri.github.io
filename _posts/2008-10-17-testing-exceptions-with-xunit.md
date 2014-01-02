---
layout: post
title: Testing exceptions with xUnit
categories: []
tags:
- Unit Testing
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-10-17 18:53:20'
comments: true
---
<p>Testing for exceptions in unit tests can be tricky. Most frameworks use the <em>ExpectedException </em>attribute to denote that the test will pass when a specific exception is raised. As an example, let's look at the following test:</p>  <p>&#160;</p>  <div style="border-bottom:gray 1px solid;border-left:gray 1px solid;line-height:12pt;background-color:#f4f4f4;width:97.5%;font-family:consolas, &#039;height:230px;max-height:200px;font-size:8pt;overflow:auto;border-top:gray 1px solid;cursor:text;border-right:gray 1px solid;margin:20px 0 10px;padding:4px;">   <div style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;padding:0;">     <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> [TestMethod]</pre>

    <pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> [ExpectedException(<span style="color:#0000ff;">typeof</span>(AuthenticationException))]</pre>

    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> Authenticate_With_Invalid_Credentials_Throws_AuthenticationException{</pre>

    <pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>&#160; </pre>

    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>     AuthenticationServices services = <span style="color:#0000ff;">new</span> AuthenticationServices();</pre>

    <pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>     </pre>

    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>     services.Authenticate(<span style="color:#006080;">&quot;user&quot;</span>, <span style="color:#006080;">&quot;wrong&quot;</span>);</pre>

    <pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>     </pre>

    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span> }</pre>
  </div>
</div>

<p>In many cases this works. If you are throwing a custom exception, then the chances of the same exception occurring in your code in the wrong place are minimal. However, things change when you are testing for system exceptions. Imagine in the previous example if we were to throw a <em>SecurityException</em> instead of <em>AuthenticationException</em>. The .NET framework could throw a security exception itself due to some specific reason. As far as the test is concerned, it passes because it doesn't care who or where the exception is thrown. It just cares that it's happened.</p>

<p>An alternative approach to this would be to wrap the specific call in a <em>try..catch</em> block and not use the <em>ExpectedException</em> attribute.</p>

<p>The guys that designed xUnit understood the shortcomings of testing exceptions and took a much cleaner approach. In xUnit, the previous test would be written like so:</p>

<div style="border-bottom:gray 1px solid;border-left:gray 1px solid;line-height:12pt;background-color:#f4f4f4;width:97.5%;font-family:consolas, &#039;height:205px;max-height:200px;font-size:8pt;overflow:auto;border-top:gray 1px solid;cursor:text;border-right:gray 1px solid;margin:20px 0 10px;padding:4px;">
  <div style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;height:154px;color:black;font-size:8pt;overflow:visible;border-style:none;padding:0;">
    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> [Fact]</pre>

    <pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> Authenticate_With_Invalid_Credentials_Throws_AuthenticationException()</pre>

    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span> {</pre>

    <pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     AuthenticationServices services = <span style="color:#0000ff;">new</span> AuthenticationServices();</pre>

    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>&#160; </pre>

    <pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>     Exception ex = Assert.Throws&lt;AuthenticationException&gt;(() =&gt; services.Authenticate(<span style="color:#006080;">&quot;user&quot;</span>, <span style="color:#006080;">&quot;wrong&quot;</span>));</pre>

    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>     </pre>

    <pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>     Assert.Equal(<span style="color:#006080;">&quot;Authentication Failed&quot;</span>, ex.Message);</pre>

    <pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas, &#039;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span> }</pre>
  </div>
</div>

<p>As you can see, there is no <em>ExpectedException</em> on the test (called a Fact in xUnit). Instead, the <em>Assert.Throws</em> construct is used. This is a generic method that takes a type parameter the type of exception we want to check for. As parameter we pass a delegate or lambda expression with the actual call that will throw the exception. </p>

<p>The obvious advantage to this is that if any other part of our system were to throw the same type of exception, our test would fails, as it should. So instead of creating a custom exception we were to use <em>SecurityException </em>and on creation of <em>AuthenticationServices</em> the framework would throw a security exception, our test would fail. </p>

<p>Another advantage of <em>Assert.Throws </em>is that it allows you to examine the returned exception object, so you can run further assertions on it (like that on line 8).</p>

<p>&#160;</p>

<p><strong>Note: </strong>While I was doing my Unit Testing session at <a href="http://www.devreach.com">Devreach</a> this week, someone asked me how to test for two exceptions within the same call in <em>Assert.Throws</em>. You don't. Each test should check for only one exception. Remember, a unit test only tests one thing, one situation. If your code is throwing two different exceptions, it's can't be doing it under the same conditions. </p>
