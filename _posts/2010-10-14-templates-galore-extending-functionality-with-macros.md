---
layout: post
title: 'Templates Galore: Extending Functionality with Macros'
categories: []
tags:
- ReSharper
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704328;}
  _elasticsearch_indexed_on: '2010-10-14 10:41:00'
comments: true
---
<p>This is the final part of a four part series on Templates:</p>  <ul>   <li><a href="/blogengine/post/2010/08/06/Templates-Galore-Live-Templates.aspx">Live Templates</a> </li>    <li><a href="/blogengine/post/2010/08/24/Templates-Galore-File-Templates.aspx">File Templates</a> </li>    <li><a href="/blogengine/post/2010/09/01/Templates-Galore-Surround-Templates.aspx">Surround Templates</a> </li>    <li>Extending Functionality with Macros </li> </ul>  <p>&#160;</p>  <p>In previous posts we saw how to create Live, File and Surround templates. We also saw that the Template Editor provided us with the ability to apply macros to placeholders. For instance, in the <a href="/blogengine/post/2010/08/06/Templates-Galore-Live-Templates.aspx">first post</a> we saw how to set the name of a variable to that of another existing one, with the first letter in lowercase, simply by choosing a macro and applying it to the placeholder.</p>  <p>Despite&#160; <a href="http://www.jetbrains.com/resharper">ReSharper</a> shipping with quite a few macros out of the box, there are always instances when we want something specific which is not available. In this post we’ll see how to easily solve this problem by writing a custom macro.</p>  <h3>Creating a custom Macro</h3>  <p>The process for creating a custom macro is overall quite simple:</p>  <ol>   <li>Create a class that implements IMacro </li>    <li>Decorate it with the Macro attribute </li>    <li>Install it as a ReSharper plug-in </li> </ol>  <h4>&#160;</h4>  <h4>1. Implementing IMacro</h4>  <p>We are going to create a simple macro that merely returns the type of the method it is used in. This not only shows us the basics of creating macros, but helps solve <a href="http://stackoverflow.com/questions/3648471/resharper-template-macro-for-method-return-type">someone’s problem</a>. Let’s start by creating an class library project and adding a class named <em>MethodResultTypeMacro. </em></p>  <p><a href="http://hhariri.files.wordpress.com/2010/11/imagea995.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="imagea995" border="0" alt="imagea995" src="http://hhariri.files.wordpress.com/2010/11/imagea995_thumb.png" width="244" height="100" /></a> </p>  <p>&#160;</p>  <p>The class should implement the <em>IMacro </em>interface. This is declared in the <em>JetBrains.ReSharper.Features.Services.dll </em>assembly (I’ve posted the complete project to GitHub so you can see all required references).</p>  <div style="display:inline;float:none;margin:0;padding:0;" id="scid:9ce6104f-a9aa-4a17-a79f-3a39532ebf7c:fd6d34c2-3faa-4d87-ae8e-d868d1aa341a" class="wlWriterSmartContent">   <div class="le-pavsc-container">     <div style="background-color:#000000;white-space:nowrap;padding:2px 5px;"><span style="color:#dfdfbf;"></span><span style="color:#efc986;">public</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">class</span><span style="color:#dfdfbf;"> </span><span style="color:#8acccf;">MethodResultTypeMacro</span><span style="color:#dfdfbf;">: </span><span style="color:#8c8cb4;">IMacro</span>        <br /><span style="color:#dfdfbf;">{</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">public</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">string</span><span style="color:#dfdfbf;"> GetPlaceholder()</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">{</span>        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">throw</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">new</span><span style="color:#dfdfbf;"> </span><span style="color:#ff0000;">NotImplementedException</span><span style="color:#dfdfbf;">();</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">}</span>        <br />        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">public</span><span style="color:#dfdfbf;"> </span><span style="color:#8acccf;">ParameterInfo</span><span style="color:#dfdfbf;">[] Parameters</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">{</span>        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">get</span><span style="color:#dfdfbf;"> { </span><span style="color:#efc986;">throw</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">new</span><span style="color:#dfdfbf;"> </span><span style="color:#ff0000;">NotImplementedException</span><span style="color:#dfdfbf;">(); }</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">}</span>        <br />        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">public</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">string</span><span style="color:#dfdfbf;"> EvaluateQuickResult(</span><span style="color:#8c8cb4;">IHotspotContext</span><span style="color:#dfdfbf;"> context, </span><span style="color:#8c8cb4;">IList</span><span style="color:#dfdfbf;"> arguments)</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">{</span>        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">throw</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">new</span><span style="color:#dfdfbf;"> </span><span style="color:#ff0000;">NotImplementedException</span><span style="color:#dfdfbf;">();</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">}</span>        <br />        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">public</span><span style="color:#dfdfbf;"> </span><span style="color:#8acccf;">HotspotItems</span><span style="color:#dfdfbf;"> GetLookupItems(</span><span style="color:#8c8cb4;">IHotspotContext</span><span style="color:#dfdfbf;"> context, </span><span style="color:#8c8cb4;">IList</span><span style="color:#dfdfbf;"> arguments)</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">{</span>        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">throw</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">new</span><span style="color:#dfdfbf;"> </span><span style="color:#ff0000;">NotImplementedException</span><span style="color:#dfdfbf;">();</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">}</span>        <br />        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">public</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">bool</span><span style="color:#dfdfbf;"> HandleExpansion(</span><span style="color:#8c8cb4;">IHotspotContext</span><span style="color:#dfdfbf;"> context, </span><span style="color:#8c8cb4;">IList</span><span style="color:#dfdfbf;"> arguments)</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">{</span>        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">throw</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">new</span><span style="color:#dfdfbf;"> </span><span style="color:#ff0000;">NotImplementedException</span><span style="color:#dfdfbf;">();</span>        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">}</span>        <br /><span style="color:#dfdfbf;">}</span></div>   </div> </div>  <p>Depending on what our Macro needs to do, the implementation details of these methods vary.</p>  <ul>   <li><em>GetPlaceHolder </em>returns a string that defines the value of the placeholder. It is mostly used for formatting, and if there is no default value, you can return simply a string such as “<em>a”</em>, which is what the vast majority of OOB macros do. </li>    <li><em>Parameters </em>define the parameters that our macro can have. Macro      <br />s that have parameters include the one we used in the first post (Value of <strong>another variable</strong> with the first character in lower case). Macros with parameters have these in bold in the name and description. If our macro does not have parameters, this should return <em>EmptyArray&lt;ParameterInfo&gt;.Instance</em> </li> </ul>  <p><a href="http://hhariri.files.wordpress.com/2010/11/image229f.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image229f" border="0" alt="image229f" src="http://hhariri.files.wordpress.com/2010/11/image229f_thumb.png" width="231" height="244" /></a> </p>  <p><a href="http://hhariri.files.wordpress.com/2010/11/imagecd44.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="imagecd44" border="0" alt="imagecd44" src="http://hhariri.files.wordpress.com/2010/11/imagecd44_thumb.png" width="244" height="49" /></a> </p>  <p>&#160;</p>  <ul>   <li><em>GetLookupItems </em>returns a list of items that will be displayed when a placeholder has focus. For instance, when invoking a Live Template that has a placeholder for a type, this would contain the list of valid types. It returns HotSpot items. A hotspot refers to elements in the template that are placeholders, whether they are editable or not. </li>    <li><em>EvaluateQuickResult </em>is called every time a hotspot obtains a value. Often the value of one hotspot can influence that of another. For instance, assume a a macro that provides information on MVC Controllers. Based on the selected controller, the next hotspot which could provide information on Actions would vary. By implementing this method we can update this information. If no additional processing is required, <em>null </em>is returned. </li>    <li><em>HandleExpansion </em>is used to perform extra activities on a hotspot. For instance when navigating to a different hotspot. If no additional processing is required, we return <em>false</em>. </li> </ul>  <p>Based on the <a href="http://stackoverflow.com/questions/3648471/resharper-template-macro-for-method-return-type">Stackoverflow post</a> mentioned previously, the author wants to be able to create a Live Template that allows him to easily insert a contract in a method that ensures that the return value is not null (this is part of Code Contracts):</p>  <pre><code>Contract.Ensure(Contract.Result&lt;$RESULTTYPE$&gt;() != null);</code></pre>

<p>In order to do this, we would define the following Live Template:</p>

<p><a href="http://hhariri.files.wordpress.com/2010/11/image2fe6.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image2fe6" border="0" alt="image2fe6" src="http://hhariri.files.wordpress.com/2010/11/image2fe6_thumb.png" width="706" height="57" /></a> </p>

<p>The placeholder we have is the $RETURNTYPE$, which we want to be filled in automatically with the return type of the method where this is declared. As such, what we need to do is implement the <em>GetLookupItems</em> to provide the return type of the method. Below is the corresponding code:</p>

<div style="display:inline;float:none;margin:0;padding:0;" id="scid:9ce6104f-a9aa-4a17-a79f-3a39532ebf7c:8758a833-df15-4b0e-b16f-fb493aab2e01" class="wlWriterSmartContent">
  <div class="le-pavsc-container">
    <div style="background-color:#000000;white-space:nowrap;padding:2px 5px;"><span style="color:#dfdfbf;"></span><span style="color:#efc986;">public</span><span style="color:#dfdfbf;"> </span><span style="color:#8acccf;">HotspotItems</span><span style="color:#dfdfbf;"> GetLookupItems(</span><span style="color:#8c8cb4;">IHotspotContext</span><span style="color:#dfdfbf;"> context, </span><span style="color:#8c8cb4;">IList</span><span style="color:#dfdfbf;">&lt;</span><span style="color:#efc986;">string</span><span style="color:#dfdfbf;">&gt; arguments)</span>

      <br /><span style="color:#dfdfbf;">{</span>

      <br />&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">var</span><span style="color:#dfdfbf;"> method = </span><span style="color:#8acccf;">TextControlToPsi</span><span style="color:#dfdfbf;">.GetContainingTypeOrTypeMember(context.SessionContext.Solution, context.SessionContext.TextControl);</span> 

      <p>&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">if</span><span style="color:#dfdfbf;"> (method </span><span style="color:#efc986;">is</span><span style="color:#dfdfbf;"> </span><span style="color:#8c8cb4;">IMethod</span><span style="color:#dfdfbf;">)</span>

        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">{</span>

        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">var</span><span style="color:#dfdfbf;"> lookupItems = </span><span style="color:#efc986;">new</span><span style="color:#dfdfbf;"> </span><span style="color:#8acccf;">List</span><span style="color:#dfdfbf;">&lt;</span><span style="color:#8c8cb4;">ILookupItem</span><span style="color:#dfdfbf;">&gt;();</span></p>

      <p>&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">var</span><span style="color:#dfdfbf;"> item = </span><span style="color:#efc986;">new</span><span style="color:#dfdfbf;"> </span><span style="color:#8acccf;">TextLookupItem</span><span style="color:#dfdfbf;">(((</span><span style="color:#8c8cb4;">IMethod</span><span style="color:#dfdfbf;">)method).ReturnType.GetPresentableName(method.Language));</span>

        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span>

        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;">lookupItems.Add(item);</span>

        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span>

        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">var</span><span style="color:#dfdfbf;"> hotSpotItems = </span><span style="color:#efc986;">new</span><span style="color:#dfdfbf;"> </span><span style="color:#8acccf;">HotspotItems</span><span style="color:#dfdfbf;">(lookupItems);</span>

        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span>

        <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">return</span><span style="color:#dfdfbf;"> hotSpotItems;</span>

        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">}</span>

        <br />&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#efc986;">return</span><span style="color:#dfdfbf;"> </span><span style="color:#efc986;">null</span><span style="color:#dfdfbf;">;</span>

        <br /><span style="color:#dfdfbf;">}</span></p>
    </div>
  </div>
</div>

<p>&#160;</p>

<p>What we are doing is using the <em>TextControlToPsi </em>class to provide us with information about a possible method the current hotspot is used in. Once we obtain this value, if it is in fact a method, we will then obtain the result type via the <em>ReturnType </em>property. This will return the fully qualified type name. We can obtain a shorter presentation using the <em>GetPresentableName </em>method. We then need to return this as the result of the <em>GetLoookupItems </em>call. This returns <em>HotSpotItems </em>which contains a list of <em>ILookupItem</em>. A specific implementation of this interface is the <em>TextLookupItem </em>which is for regular text values. We thus create a new instance of this class, add it to the list and return this last one.</p>

<p>Since we do not need any additional functionality, the rest of the methods return the default va
  <br />lues.</p>

<h4>&#160;</h4>

<h4>2. Metadata for our Macro</h4>

<p>We now need to provide some additional information for our Macro so that ReSharper knows what information to display in the Macro selection box. This is provided with the <em>Macro</em> attribute and has three properties:</p>

<div style="display:inline;float:none;margin:0;padding:0;" id="scid:9ce6104f-a9aa-4a17-a79f-3a39532ebf7c:2eb2d5d3-2d82-4de3-aeb1-982fd52bf139" class="wlWriterSmartContent">
  <div class="le-pavsc-container">
    <div style="background-color:#000000;white-space:nowrap;padding:2px 5px;"><span style="color:#dfdfbf;">[</span><span style="color:#8acccf;">Macro</span><span style="color:#dfdfbf;">(</span><span style="color:#dfaf8f;">&quot;CustomTemplateMacros.MethodResultTypeMacro&quot;</span><span style="color:#dfdfbf;">, </span>

      <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">ShortDescription = </span><span style="color:#dfaf8f;">&quot;Result type of containing method&quot;</span><span style="color:#dfdfbf;">,</span>

      <br />&#160;&#160;&#160; <span style="color:#dfdfbf;">LongDescription = </span><span style="color:#dfaf8f;">&quot;Obtains the result type of the containing method it is used in&quot;</span><span style="color:#dfdfbf;">)]</span></div>
  </div>
</div>

<p>&#160;</p>

<ul>
  <li><em>Name </em>normally refers to the package and macro name. Macros are referenced by this field. </li>

  <li><em>ShortDescription </em>provides the description that will be displayed in Macro selection box. </li>

  <li><em>LongDescription </em>provides the description that will be displayed in the description box when selecting the macro. </li>
</ul>

<p>If the Macro has properties, these can be referenced (and hyperlinks provided to them so that they are clickable) using the<em> </em>syntax {#0:description of variable} where the number indicates the position of the variable. For instance, in the case of replacing one variable with the value of another in lowercase, the <em>ShortDescription </em>would be:</p>

<div style="display:inline;float:none;margin:0;padding:0;" id="scid:9ce6104f-a9aa-4a17-a79f-3a39532ebf7c:be8f98c4-06f7-4d3b-91a0-4668be491f6d" class="wlWriterSmartContent">
  <div class="le-pavsc-container">
    <div style="background-color:#000000;white-space:nowrap;padding:2px 5px;"><span style="color:#dfaf8f;">Value of {#0:another variable} with the first character in upper case</span></div>
  </div>
</div>

<h4>&#160;</h4>

<h4>3. Installing the Macro</h4>

<p>We now compile the project and place it in a folder un the ReSharper Bin\Plugins folder [<a href="/blogengine/post/2010/01/12/Writing-plug-ins-for-ReSharper-Part-1-of-Undefined.aspx">See my posts on ReSharper plug-ins for more information</a>]. Once we restart Visual Studio, we should now see the Macro displayed in the Macro selection box. Below is what our Live Template definition looks like. Notice that we’ve made the occurrence of the placeholder non-editable since we are not interested in choosing an option.</p>

<p>&#160;</p>

<p><a href="http://hhariri.files.wordpress.com/2010/11/image8504.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image8504" border="0" alt="image8504" src="http://hhariri.files.wordpress.com/2010/11/image8504_thumb.png" width="344" height="265" /></a> </p>

<p><a href="http://hhariri.files.wordpress.com/2010/11/image050f.png"><img style="border-bottom:0;border-left:0;display:inline;border-top:0;border-right:0;" title="image050f" border="0" alt="image050f" src="http://hhariri.files.wordpress.com/2010/11/image050f_thumb.png" width="297" height="314" /></a> </p>

<p>&#160;</p>

<p>Now all we need to do is type <em>crn </em>and hit Tab to have a contract inserted automatically with the corresponding return type of the containing method:</p>

<div style="display:inline;float:none;margin:0;padding:0;" id="scid:9ce6104f-a9aa-4a17-a79f-3a39532ebf7c:deef7230-ba2a-46d9-8d98-1bb175e9d82e" class="wlWriterSmartContent">
  <div class="le-pavsc-container">
    <div style="background-color:#000000;white-space:nowrap;padding:2px 5px;"><span style="color:#dfdfbf;"></span><span style="color:#efc986;">public</span><span style="color:#dfdfbf;"> </span><span style="color:#8acccf;">ActionResult</span><span style="color:#dfdfbf;"> Index()</span>

      <br /><span style="color:#dfdfbf;">{</span> 

      <p>&#160;&#160;&#160; <span style="color:#dfdfbf;"></span><span style="color:#8acccf;">Contract</span><span style="color:#dfdfbf;">.Ensures(</span><span style="color:#8acccf;">Contract</span><span style="color:#dfdfbf;">.Result&lt;</span><span style="color:#8acccf;">ActionResult</span><span style="color:#dfdfbf;">&gt;() != </span><span style="color:#efc986;">null</span><span style="color:#dfdfbf;">);</span></p>
    </div>
  </div>
</div>

<h3>&#160;</h3>

<h3>Summary</h3>

<p>Hopefully you’ve now seen that creating custom macros is not rocket science in ReSharper and opens up a world of possibilities when dealing with Live Templates, allowing us to do pretty much anything. The entire code for the project has been uploaded to <a href="http://github.com/hhariri/Blog">GitHub under my Blog repository</a>. Please feel free to use it as you wish.</p>
