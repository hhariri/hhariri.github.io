---
layout: post
title: Problem with Client-Side Validation in MVC 2
categories: []
tags:
- Architecture
- ASP.NET MVC
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-10-07 18:31:00'
comments: true
---
<p>
&nbsp;
</p>
<p>
<strong>[Note: This post applies to ASP.NET MVC 2, Preview 2.0]</strong>
</p>
<p>
Today while doing the demo for the <a href="/blogengine/post/2009/10/06/Client-Side-Validation-in-MVC-20.aspx">previous post</a>, I ran into an issue where the Javascript code for the client-side validation (the call to <em>EnableClientValidation </em>) was not being output during the form rendering.
</p>
<p>
Take a look at the following two snippets:
</p>
<p>
<strong>First:</strong>
</p>
<div class="csharpcode">
<pre class="alt">
    &lt;% Html.BeginForm();%&gt;
</pre>
<pre>
&nbsp;
</pre>
<pre class="alt">
        &lt;%=Html.EditorForModel() %&gt;
</pre>
<pre>
            &lt;p&gt;
</pre>
<pre class="alt">
                &lt;input type=<span class="str">&quot;submit&quot;</span> <span class="kwrd">value</span>=<span class="str">&quot;Save&quot;</span> /&gt;
</pre>
<pre>
            &lt;/p&gt;
</pre>
<pre class="alt">
    &lt;% Html.EndForm(); %&gt;
</pre>
</div>
<p>
&nbsp;
</p>
<p>
<strong>Second:</strong>
</p>
<div class="csharpcode">
<pre class="alt">
  &lt;% <span class="kwrd">using</span> (Html.BeginForm())  &gt;
</pre>
<pre>
&nbsp;
</pre>
<pre class="alt">
        &lt;%=Html.EditorForModel() %&gt;
</pre>
<pre>
            &lt;p&gt;
</pre>
<pre class="alt">
                &lt;input type=<span class="str">&quot;submit&quot;</span> <span class="kwrd">value</span>=<span class="str">&quot;Save&quot;</span> /&gt;
</pre>
<pre>
            &lt;/p&gt;
</pre>
<pre class="alt">
    &lt;% } %&gt;
</pre>
</div>
<p>
&nbsp;
</p>
<p>
See the difference? The latter is using the <em>using </em>statement. In my previous post I&rsquo;m using this option and all works well. However, if you go with the first option, the Javascript call will not be output. The reason for this (after debugging the source) is that the call to make this happen takes place in the <em>Dispose </em>method of the <em>MvcForm</em>. Explicitly calling <em>Html.EndForm</em> won&rsquo;t cause this to take place.
</p>
<p>
I&rsquo;ve talked to Mathew from the QA team, and <a href="http://twitter.com/osbornm/status/4689501425">he&rsquo;s confirmed it&rsquo;s a known issue</a>. I think the output of the JS code should ideally be decoupled from the form construction. For instance, If I were to use a manual form tag, this wouldn&rsquo;t work either [I&rsquo;ve haven&rsquo;t given it that much thought either].
</p>
<p>
In the meantime, if you want client-side validation, make sure you use the second option.
</p>
