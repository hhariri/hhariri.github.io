---
layout: post
title: The Principle of Least Surprise
categories: []
tags:
- Architecture
- ASP.NET MVC
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-10-09 09:23:14'
  twitter_cards_summary_img_size: ''
comments: true
---
<p>&#160;</p>  <p>I’m having a discussion on the ASP.NET MVC forums with one of the guys from the ASP.NET team in regard to the Data Annotations in MVC 2 and I’m not sure I agree with him. Here’s an issue <a href="http://devlicio.us/blogs/casey/">Jak</a> and I have run into: </p>  <p>In MVC 2 there’s a new Html Helper named <em>EditorForModel(); </em>that renders out a form based on the properties of your model, along with the validation messages, labels, etc. So something like this:</p>  <p>&#160;</p>  <div class="csharpcode">   <pre class="alt">   &lt;% <span class="kwrd">using</span> (Html.BeginForm())  &gt;</pre>

  <pre>&#160;</pre>

  <pre class="alt">        &lt;%=Html.EditorForModel() %&gt;     </pre>

  <pre>            &lt;p&gt;</pre>

  <pre class="alt">                &lt;input type=<span class="str">&quot;submit&quot;</span> <span class="kwrd">value</span>=<span class="str">&quot;Save&quot;</span> /&gt;</pre>

  <pre>            &lt;/p&gt;</pre>

  <pre class="alt">    &lt;% } %&gt;</pre>
</div>

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
.csharpcode .lnum { color: #606060; }

<p>&#160;</p>

<p>you’d get something like this:</p>

<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ThePrincipleofLeastSurprise/1A28AE20/image.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image" border="0" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ThePrincipleofLeastSurprise/36E22335/image_thumb.png" width="373" height="230" /></a> </p>

<p>If you want to do individual fields and thus have finer control, you can use the <em>EditorFor</em> helper, passing in a property name. In other words, the previous could be also rendered as:</p>

<div class="csharpcode">
  <pre class="alt">    &lt;% <span class="kwrd">using</span> (Html.BeginForm())  &gt;</pre>

  <pre>&#160;</pre>

  <pre class="alt">        </pre>

  <pre>   &lt;%=Html.EditorFor( model =&gt; model.FirstName) %&gt; </pre>

  <pre class="alt">   &lt;%=Html.EditorFor( model =&gt; model.LastName) %&gt;</pre>

  <pre>   &lt;%=Html.EditorFor( model =&gt; model.Email) %&gt;</pre>

  <pre class="alt">        </pre>

  <pre>            &lt;p&gt;</pre>

  <pre class="alt">                &lt;input type=<span class="str">&quot;submit&quot;</span> <span class="kwrd">value</span>=<span class="str">&quot;Save&quot;</span> /&gt;</pre>

  <pre>            &lt;/p&gt;</pre>

  <pre class="alt">    &lt;% } %&gt;</pre>
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

<p>but this time you don’t get the labels: </p>

<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ThePrincipleofLeastSurprise/5BFF6DA1/image.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image" border="0" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ThePrincipleofLeastSurprise/61DA113A/image_thumb.png" width="393" height="247" /></a> </p>

<p>The problem however is that you lose something else: the Validation messages. If you have client-side validation enabled, the previous ASPX file generates a pretty much useless call to the <em>EnableClientValidation</em> JS function: </p>

<div class="csharpcode">
  <pre class="alt">EnableClientValidation({<span class="str">&quot;Fields&quot;</span>:[],<span class="str">&quot;FormId&quot;</span>:<span class="str">&quot;form0&quot;</span>}, <span class="kwrd">null</span>);</pre>
</div>

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
.csharpcode .lnum { color: #606060; }

<p>&#160;</p>

<p>as opposed to: </p>

<div class="csharpcode">
  <div class="csharpcode">
    <div class="csharpcode">
      <pre class="alt">EnableClientValidation({<span class="str">&quot;Fields&quot;</span>:[{<span class="str">&quot;FieldName&quot;</span>:<span class="str">&quot;FirstName&quot;</span>,<span class="str">&quot;ValidationRules&quot;</span>:[{<span class="str">&quot;ErrorMessage&quot;</span>:<span class="str">&quot;First name is required&quot;</span>,<span class="str">&quot;ValidationParameters&quot;</span>:....</pre>

      <pre>&#160;</pre>

      <pre class="alt">// rest omitted <span class="kwrd">for</span> brevity</pre>
    </div>
    
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
.csharpcode .lnum { color: #606060; }</div>
  
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
.csharpcode .lnum { color: #606060; }</div>

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
.csharpcode .lnum { color: #606060; }

<p>&#160;</p>

<p>The result of course is that client-validation doesn’t work (and from what I’ve heard causes JS errors in some browsers). </p>

<p>The solution to this is to explicitly add a Validation Message, like so:</p>

<div class="csharpcode">
  <pre class="alt">&lt;%=Html.ValidationMessage(<span class="str">&quot;FirstName&quot;</span>)%&gt;</pre>
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

<p>Now I understand that <em>EditorFor </em>is for fine-tuning and there is a corresponding <em>LabelFor</em> (although a <em>ValidationFor </em>doesn’t exist yet), but my main concern here is that it’s breaking the principle of least surprise from an API perspective. </p>

<p>For me, the only difference between <em>EditorFor</em> and <em>EditorForModel</em> should be that in the first I specify a property name explicitly whereas in the latter it just assumes the whole model. Nothing is telling me by the name of the method that the second does a whole bunch more of magic. </p>

<p>One solution is for <em>EditorFor</em> to be renamed to something else if it’s ONLY going to provide the input box (be it a text area, checkbox, radio group, etc..).</p>

<p>Thoughts?</p>
