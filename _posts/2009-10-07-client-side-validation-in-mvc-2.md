---
layout: post
title: Client-Side Validation in MVC 2
categories: []
tags:
- Architecture
- ASP.NET MVC
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-10-07 05:31:00'
comments: true
---
<p>
&nbsp;
</p>

<p>
ASP.NET MVC 2 Preview 2 now ships with client-side validation built into the box. It follows the same idea as the <a href="http://www.codeplex.com/xval">xVal</a> framework whereby you can define validation rules once and have them enforced both on the server and the client.
</p>

<p>
By default, MVC uses Data Annotations which is available in System.ComponentModel.DataAnnotations on the server and the jQuery Validator plugin on the client. Much like xVal you can customize these to use whatever you want. I&rsquo;m preparing some demos for next week of how to do client-side validation and since there isn&rsquo;t much info on it, I&rsquo;ve decided to post it.
</p>

<h3>Server-Side Validation</h3>
<p>
Server-side validation with Data Annotations works without having to take any additional steps. You decorate your model using attributes and the model binder uses this information to set the ModelState.
</p>

<div class="csharpcode">

<pre class="alt">
    <span class="kwrd">public</span> <span class="kwrd">class</span> Customer
</pre>
<pre>
    {
</pre>
<pre class="alt">
        [Required(ErrorMessage = <span class="str">&quot;First name is required&quot;</span>)]
</pre>
<pre>
        <span class="kwrd">public</span> <span class="kwrd">string</span> FirstName { get; set; }
</pre>
<pre class="alt">
        [Required(ErrorMessage = <span class="str">&quot;Last name is required&quot;</span>)]
</pre>
<pre>
        <span class="kwrd">public</span> <span class="kwrd">string</span> LastName { get; set; }
</pre>
<pre>
        <span class="kwrd">public</span> <span class="kwrd">string</span> Email { get; set; }
</pre>
<pre class="alt">
    }
</pre>
</div>
<p>
&nbsp;
</p>
<p>
On the server-side you would do the usual to check if the model state is valid and if not display validation messages back to the client:
</p>
<div class="csharpcode">
<pre class="alt">
        [AcceptVerbs(HttpVerbs.Post)]
</pre>
<pre>
        <span class="kwrd">public</span> ActionResult Edit(<span class="kwrd">int</span> id, Customer customer)
</pre>
<pre class="alt">
        {
</pre>
<pre>
            <span class="kwrd">if</span> (ModelState.IsValid)
</pre>
<pre class="alt">
            {
</pre>
<pre>
                <span class="rem">// TODO: Do whatever...</span>
</pre>
<pre class="alt">
                <span class="kwrd">return</span> RedirectToAction(<span class="str">&quot;Index&quot;</span>);
</pre>
<pre>
            }
</pre>
<pre class="alt">
            <span class="kwrd">return</span> View(customer);
</pre>
<pre>
        }
</pre>
</div>
<p>
&nbsp;
</p>
<p>
The form is:
</p>
<div class="csharpcode">
<div class="csharpcode">
<pre class="alt">
    &lt;%= Html.ValidationSummary() %&gt;
</pre>
<pre>
    &lt;% <span class="kwrd">using</span> (Html.BeginForm())  &gt;
</pre>
<pre class="alt">
&nbsp;
</pre>
<pre>
        &lt;%=Html.EditorForModel() %&gt;
</pre>
<pre class="alt">
            &lt;p&gt;
</pre>
<pre>
                &lt;input type=<span class="str">&quot;submit&quot;</span> <span class="kwrd">value</span>=<span class="str">&quot;Save&quot;</span> /&gt;
</pre>
<pre class="alt">
            &lt;/p&gt;
</pre>
<pre>
    &lt;% } %&gt;
</pre>
</div>
<pre>
&nbsp;
</pre>
</div>
<p>
(I&rsquo;m using the EditForModel which will automatically generate an input field for each property of the model. If you want finer control you can spit out individual fields or use templates).
</p>
<h3>Client-Side Validation</h3>
<p>
Client-Side validation kicks in only if it is explicitly activated in the view. To do this, you need to call EnableClientValidation as shown below:
</p>
<div class="csharpcode">
<pre>
&nbsp;
</pre>
<div class="csharpcode">
<pre class="alt">
    &lt;% Html.EnableClientValidation(); %&gt;
</pre>
<pre>
    &lt;%= Html.ValidationSummary() %&gt;
</pre>
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
</div>
<p>
&nbsp;
</p>
<p>
By doing this, when the form is generated, the MVC framework will add a call to JS function <em>EnableClientValidation </em>passing in the correct parameters based on the data annotation attributes defined on the model. Last but not least, we need to include 3 Javascript files in the View (I normally put them in Site.Master).
</p>
<div class="csharpcode">
<pre class="alt">
    &lt;script src=<span class="str">&quot;../../Scripts/jquery-1.3.2.min.js&quot;</span> type=<span class="str">&quot;text/javascript&quot;</span>&gt;&lt;/script&gt;
</pre>
<pre>
    &lt;script src=<span class="str">&quot;../../Scripts/jquery.validate.min.js&quot;</span> type=<span class="str">&quot;text/javascript&quot;</span>&gt;&lt;/script&gt;
</pre>
<pre class="alt">
    &lt;script src=<span class="str">&quot;../../Scripts/MicrosoftMvcJQueryValidation.js&quot;</span> type=<span class="str">&quot;text/javascript&quot;</span>&gt;&lt;/script&gt;
</pre>
</div>
<p>
&nbsp;
</p>
<p>
Make sure you include the last file, where <em>EnableClientValidation </em>is defined. That&rsquo;s all there is to it. Once you run this, your app will have both client side and server side validation using the default Data Annotations and jQuery Validator.
</p>
<p>
<a href="/Downloads/Validation.zip">Download demo from here</a>
</p>
