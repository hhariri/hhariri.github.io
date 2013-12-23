---
layout: post
title: Break this test
categories: []
tags:
- ASP.NET MVC
- Unit Testing
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-02-12 14:24:25'
---
<p>Given the following action:</p>  <p>&#160;</p>  <div>   <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">     <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> ActionResult About()</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">return</span> View();</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span> }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>&#160; </pre>
  </div>
</div>

<p>and the following test:</p>

<div>
  <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> About()</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     <span style="color:#008000;">// Arrange</span></pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>     HomeController controller = <span style="color:#0000ff;">new</span> HomeController();</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>     <span style="color:#008000;">// Act</span></pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>     ViewResult result = controller.About() <span style="color:#0000ff;">as</span> ViewResult;</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  10:</span>     <span style="color:#008000;">// Assert</span></pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  11:</span>     Assert.IsNotNull(result);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  12:</span> }</pre>
  </div>
</div>

<p>&#160;</p>

<p>Come up with as many way as you can to break the test.</p>

<p>(This is the default code generated with a new ASP.NET MVC application)</p>
