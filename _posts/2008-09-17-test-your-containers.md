---
layout: post
title: Test your containers
categories: []
tags: []
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-09-17 13:03:20'
comments: true
---
<p>IoC containers are great. They take away the burden of having to create dependencies before using things, and when your dependencies start to become complex and you have a whole graph of them, it can get ugly if you're not using one. So to the rescue comes Mr. Unity, Mr. StructureMap, Don AutoFac or the Hero Ninject. Take your pick.</p>  <p>But all this greatness can come back and bite you on the tip of your pinky finger (the one on the right hand). Why is that? </p>  <p>Let's assume you have the following class:</p>  <div class="csharpcode-wrapper">   <div class="csharpcode">     <div style="border-right:gray 1px solid;border-top:gray 1px solid;font-size:8pt;overflow:auto;border-left:gray 1px solid;width:97.5%;cursor:text;max-height:200px;line-height:12pt;border-bottom:gray 1px solid;font-family:consolas, &#039;background-color:#f4f4f4;margin:20px 0 10px;padding:4px;">       <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">         <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> CustomerServices    </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {   </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>    <span style="color:#0000ff;">private</span> <span style="color:#0000ff;">readonly</span> ICustomerRepository _customerRepository;    </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>&#160; </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>    <span style="color:#0000ff;">public</span> CustomerServices(ICustomerRepository repository) </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>    {</pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>&#160; </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>      _customerRepository = repository;   </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span>&#160; </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  10:</span>    }  </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  11:</span>&#160; </pre>

        <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  12:</span> ...</pre>
      </div>
    </div>
  </div>
</div>

<p>&#160;</p>

<p>and you decide to introduce a new dependency</p>

<div style="border-right:gray 1px solid;border-top:gray 1px solid;font-size:8pt;overflow:auto;border-left:gray 1px solid;width:97.5%;cursor:text;max-height:200px;line-height:12pt;border-bottom:gray 1px solid;font-family:consolas, &#039;background-color:#f4f4f4;margin:20px 0 10px;padding:4px;">
  <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> CustomerServices    </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>    <span style="color:#0000ff;">private</span> <span style="color:#0000ff;">readonly</span> ICustomerRepository _customerRepository;    </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>    <span style="color:#0000ff;">private</span> <span style="color:#0000ff;">readonly</span> IAuditingServices _auditingServices;</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>    <span style="color:#0000ff;">public</span> CustomerServices(ICustomerRepository repository, IAuditingServices auditingServices) </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>    {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span>      _customerRepository = repository;   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  10:</span>      _auditingServices = auditingServices;</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  11:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  12:</span>    }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  13:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  14:</span> ...</pre>
  </div>
</div>

<p>&#160;</p>

<p>That code will compile, as will any other code throughout the project that is using <em>CustomerServices</em>. It's only then when the container tries to resolve <em>CustomerServices</em>, will it see that you have not registered any type for <em>IAuditingServices</em>. And this happens at runtime. </p>

<p>So it's important to create <strong>configuration tests</strong> for your containers. </p>
