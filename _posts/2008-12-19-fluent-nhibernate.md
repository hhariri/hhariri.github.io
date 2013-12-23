---
layout: post
title: Fluent NHibernate
categories: []
tags:
- NHibernate
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-12-19 09:05:24'
---
<p>I've recently started a new internal project and decided to use NHibernate. I've used NHibernate previously on several projects and one of the things I didn't like was the mapping. That's where you waste the most time since and for refactoring it sucks. Every time you need to create a new property or change an existing one, you need to make sure you've updated the XML mapping file. </p>  <p>I had decided to check out the <a href="http://blog.jagregory.com/2008/08/08/introducing-fluent-nhibernate">fluent nhibernate</a> project that I had heard about. I thought even though it didn't do away with the mapping, at least you had it in code, so you could easily refactor and do away with some of the mapping errors you initially face. Luckily before I started this project, I ran across <a href="http://www.ayende.com/Blog/">Ayende's</a> post on the new Auto-Mapping features of Fluent NHibernate, and I must say, I've been blown away (<a href="http://twitter.com/hhariri">my twitter</a> followers are probably starting to get sick of me). </p>  <p>I'm now able to do true TDD without having to touch a line of SQL or XML. The only reason I open up SQL Management Studio is to just make sure that the automapping is working correctly, and it is. It handles one to many, many to one, many to many, anything you could think of. And the beauty of it is, that if there is something it can't handle, you can still map it yourself in code. </p>  <p>Take this class:</p>  <p>&#160;</p>  <div>   <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">     <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Customer</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">int</span> Id { get; set; }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> NameFirst { get; set; }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> NameLast { get; set; }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> ICollection&lt;Invoice&gt; Invoices { get; set; }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span> }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Invoice</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  10:</span> {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  11:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">int</span> Id { get; set;}</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  12:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Number { get; set; }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  13:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> DateTime Date { get; set; }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  14:</span>     <span style="color:#008000;">// Rest omitted...</span></pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  15:</span> }</pre>
  </div>
</div>

<p>&#160;</p>

<p>The only thing I have to do, to configure this is:</p>

<p>&#160;</p>

<div>
  <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> persistenceModel.AddEntityAssembly(assembly)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span>     .Where(entity =&gt; entity.Namespace == <span style="color:#006080;">&quot;iMeta.Example.Domain.Entities&quot;</span> &amp;&amp; entity.GetProperty(<span style="color:#006080;">&quot;Id&quot;</span>) != <span style="color:#0000ff;">null</span>)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     .WithConvention(convention =&gt; convention.GetForeignKeyName = p =&gt; p.Name + <span style="color:#006080;">&quot;Id&quot;</span>)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     .Configure(config);</pre>
  </div>
</div>

<p>That's it. The only thing that I don't seem to know how to handle yet is components. For now I'm adding some manual mapping (something I'm missing?). So for instance, if Customer has an Address property like so:</p>

<div>
  <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Address </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Street { get; set;}</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> City { get; set;}</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> State { get; set;}</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span> }</pre>
  </div>
</div>

<p>and the corresponding property on Customer:</p>

<div>
  <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Customer</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     ...</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> ICollection&lt;Address&gt; Addresses { get; set; }</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span> }</pre>
  </div>
</div>

<p>the resulting configuration would be (line 4 is new):</p>

<div>
  <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> persistenceModel.AddEntityAssembly(assembly)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span>     .Where(entity =&gt; entity.Namespace == <span style="color:#006080;">&quot;iMeta.Example.Domain.Entities&quot;</span> &amp;&amp; entity.GetProperty(<span style="color:#006080;">&quot;Id&quot;</span>) != <span style="color:#0000ff;">null</span>)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     .WithConvention(convention =&gt; convention.GetForeignKeyName = p =&gt; p.Name + <span style="color:#006080;">&quot;Id&quot;</span>)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     .ForTypesThatDeriveFrom&lt;Customer&gt;(map =&gt; map.Component&lt;Address&gt;(t =&gt; t.Addresses,</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>                                                                          c =&gt;</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>                                                                          {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>                                                                              c.Map(t =&gt; t.Street);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>                                                                              c.Map(t =&gt; t.City);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span>                                                                              c.Map(t =&gt; t.State);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  10:</span>                                                                          }))</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  11:</span>     .Configure(config);</pre>
  </div>
</div>

<p>If you don't add this, it will create a table in the database of type Address and reference the customer with a foreign key, as opposed to flattening out Address to fields in the Customer table.</p>

<p>If you combine all this with a call to <em>SchemaExport </em>(Nhibernate Tools namespace), you can have it create your database schema for you. Do this in your tests and you no longer have to worry about cleaning up your database before each test or creating scripts that need to be run as part of your CI build. Very cool! </p>
