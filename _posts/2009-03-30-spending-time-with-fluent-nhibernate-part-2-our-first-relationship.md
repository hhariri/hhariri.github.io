---
layout: post
title: 'Spending time with Fluent NHibernate (Part 2): Our first Relationship'
categories: []
tags:
- NHibernate
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-03-30 10:19:00'
---
<p>
In the <a href="http://blogs.imeta.co.uk/HHariri/archive/2009/03/25/spending-time-with-fluent-nhibernate-part-1.aspx">first part of this series</a>, we saw the basics of what Fluent NHibernate is about. In this second part, we&#039;re going to look into relationships and some of the mappings that FNH produces for us, as well as overriding certain mappings.
</p>

<p>
&nbsp;
</p>

<p>
<strong>Relationships</strong>
</p>

<p>
Let&#039;s say we have a new requirement that requires all customers to have multiple documents associated with them.
</p>

<p>
In terms of a relational database world, if we were to have two tables, one representing customers, and the other documents, the result would be:
</p>

<p>
&nbsp;
</p>

<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/SpendingtimewithFluentNHibernatePart2_D011/image_2.png"><img style="border-width:0;" src="/blogengine/image.axd?picture=WindowsLiveWriter/SpendingtimewithFluentNHibernatePart2_D011/image_thumb.png" border="0" alt="image" width="629" height="218" /></a>
</p>

<p>
There would be a <em>foreign key </em>in <em>Document </em>pointing to the customer Id of the <em>Customer</em>.
</p>

<p>
In an OO world, we don&#039;t (or shouldn&#039;t) care about how information is persisted. In other words, when designing our classes, all we care about is having a list of documents that is related to a customer:
</p>

<p>
&nbsp;
</p>

<div>

<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> <strong>Document</strong>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">int</span> Id { get; <span style="color:#0000ff;">private</span> set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Code { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> DateTime Date { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Author { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Contents { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span> }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> <strong>Customer</strong>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>    {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>        <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">int</span> Id { get; <span style="color:#0000ff;">private</span> set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>        <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> NameFirst { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span>        <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> NameLast { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  16:</span>        <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Telephone { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  17:</span>        <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Email { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  18:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  19:</span>        <strong><font color="#ff0000"><span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> </font><font color="#000000">ISet&lt;Document&gt; Documents { get; set; }</font></strong>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  20:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  21:</span>        <span style="color:#0000ff;">public</span> Customer()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  22:</span>        {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  23:</span>            Documents = <span style="color:#0000ff;">new</span> HashedSet&lt;Document&gt;();
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  24:</span>        }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  25:</span>    }
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
Our <em>Customer </em>class contains a collection of <em>Documents </em>(line 19). Why is this an <em>ISet </em>as opposed to an <em>IList </em>or <em>ICollection</em>? A set represents an unordered collection of objects that does not allow duplicates*. Having this class layout, let&#039;s put it through Fluent NHibernate to see what it spits out.
</p>
<p>
&nbsp;
</p>
<p>
[* The .NET framework does not come with a type <em>Set</em>. However, all distributions of NHibernate come with the <em>Iesi.Collections</em> assembly, since it&#039;s used internally. So you don&#039;t have much to worry about.]
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
<strong>Project Layout</strong>
</p>
<p>
Before continuing, let&#039;s take a look at our project layout:
</p>
<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/SpendingtimewithFluentNHibernatePart2_D011/image_4.png"><img style="border-width:0;" src="/blogengine/image.axd?picture=WindowsLiveWriter/SpendingtimewithFluentNHibernatePart2_D011/image_thumb_1.png" border="0" alt="image" width="293" height="368" /></a>
</p>
<p>
We have three projects:
</p>
<p>
1. <strong>Example.Domain</strong> which is our application per say. This is where our entities reside.
</p>
<p>
2. <strong>Example.Repository</strong> is where our NHibernate repository will eventually be. It is also where our Mapping configuration is located.
</p>
<p>
3. <strong>Example.FluentHelpers</strong> is a series of classes that will help with generating the database structure, etc.
</p>
<p>
The reason that our Mapping file is kept in the repository is two-fold:
</p>
<blockquote>
	<p>
	1. <strong>FluentHelpers</strong> can be re-used and is project independent. It knows nothing of specific entities or mappings.
	</p>
</blockquote>
<blockquote>
	<p>
	2. <strong>Domain</strong> should have no reference to the persistence mechanism and as such should not know whether we use NHibernate or any other type of ORM.
	</p>
</blockquote>
<p>
Our FluentMapper class is just a wrapper around Fluent Nhibernate and NHibernates tools namespace, with three methods: <em>SaveMappings</em>, <em>CreateDatabase</em> and <em>UpdateDatabase.</em> The <em>SaveMappings </em>exports the mappings Fluent NHibernate creates for us to a specific folder (remember, each class has it&#039;s own mapping). The implementation is very straight forward:
</p>
<p>
&nbsp;
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">void</span> SaveMappings(<span style="color:#0000ff;">string</span> path)
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>     _persistenceModel.WriteMappingsTo(path);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span> }
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
As for our mapping configuration, NHMapping, this is where we&#039;ll eventually add specific configurations overriding Fluent NHibernate&#039;s default settings. But for now it&#039;s just that one line of code. The reason is returns an AutoPersistenceModel is because this is what we pass into our FluentMapper to actually do the work.
</p>
<p>
&nbsp;
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">static</span> AutoPersistenceModel GetMapping()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">return</span> AutoPersistenceModel.MapEntitiesFromAssemblyOf&lt;Customer&gt;();
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span> }
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
<strong>Generating Mapping Files <br />
</strong>
</p>
<p>
Once we put all this code together, we can see the mapping Fluent NHibernate generates for us. To make things easier, I&#039;ve included a MSBuild task (FluentTask) that does this, along with creating/recreating databases if required (works great as part of an integration test). Here&#039;s a sample MSBuild project file to generate the mappings for us:
</p>
<p>
&nbsp;
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">&lt;?</span><span style="color:#800000;">xml</span> <span style="color:#ff0000;">version</span><span style="color:#0000ff;">=&quot;1.0&quot;</span> <span style="color:#ff0000;">encoding</span><span style="color:#0000ff;">=&quot;utf-8&quot;</span> ?<span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">Project</span> <span style="color:#ff0000;">xmlns</span><span style="color:#0000ff;">=&quot;http://schemas.microsoft.com/developer/msbuild/2003&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>   <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">UsingTask</span> <span style="color:#ff0000;">AssemblyFile</span><span style="color:#0000ff;">=&quot;Example.FluentHelpers.dll&quot;</span> <span style="color:#ff0000;">TaskName</span><span style="color:#0000ff;">=&quot;FluentTask&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>   <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">Target</span> <span style="color:#ff0000;">Name</span><span style="color:#0000ff;">=&quot;Default&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">FluentTask</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>       <span style="color:#ff0000;">PersistenceModel</span><span style="color:#0000ff;">=&quot;Example.Repository.dll, Example.Repository.NHMappings, GetMapping&quot;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>       <span style="color:#ff0000;">ConnectionString</span><span style="color:#0000ff;">=&quot;Data Source=.\SQLEXPRESS;Initial Catalog=FluentExample;Integrated Security=SSPI&quot;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>       <span style="color:#ff0000;">MappingOutputFolder</span><span style="color:#0000ff;">=&quot;C:\Temp&quot;</span><span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>   <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">Target</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span> <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">Project</span><span style="color:#0000ff;">&gt;</span>
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
For illustrative purposes (i.e. this is NOT needed if you&#039;re using Fluent NHibernate), let&#039;s see the generated output for our classes:
</p>
<p>
<em>Customer.hbm</em>
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">&lt;?</span><span style="color:#800000;">xml</span> <span style="color:#ff0000;">version</span><span style="color:#0000ff;">=&quot;1.0&quot;</span> <span style="color:#ff0000;">encoding</span><span style="color:#0000ff;">=&quot;utf-8&quot;</span>?<span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">hibernate-mapping</span> <span style="color:#ff0000;">xmlns</span><span style="color:#0000ff;">=&quot;urn:nhibernate-mapping-2.2&quot;</span> <span style="color:#ff0000;">assembly</span><span style="color:#0000ff;">=&quot;Example.Domain, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null&quot;</span> <span style="color:#ff0000;">namespace</span><span style="color:#0000ff;">=&quot;Example.Domain&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>   <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">class</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Customer&quot;</span> <span style="color:#ff0000;">table</span><span style="color:#0000ff;">=&quot;`Customer`&quot;</span> <span style="color:#ff0000;">xmlns</span><span style="color:#0000ff;">=&quot;urn:nhibernate-mapping-2.2&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">id</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Id&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;Int32&quot;</span> <span style="color:#ff0000;">column</span><span style="color:#0000ff;">=&quot;Id&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">generator</span> <span style="color:#ff0000;">class</span><span style="color:#0000ff;">=&quot;identity&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">id</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">property</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;NameFirst&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;String&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">column</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;NameFirst&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">property</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">property</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Telephone&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;String&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">column</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Telephone&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">property</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">property</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Email&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;String&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">column</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Email&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">property</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  16:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">property</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;NameLast&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;String&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  17:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">column</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;NameLast&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  18:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">property</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  19:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">set</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Documents&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  20:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">key</span> <span style="color:#ff0000;">column</span><span style="color:#0000ff;">=&quot;Customer_id&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  21:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">one-to-many</span> <span style="color:#ff0000;">class</span><span style="color:#0000ff;">=&quot;Example.Domain.Document, Example.Domain, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  22:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">set</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  23:</span>   <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">class</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  24:</span> <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">hibernate-mapping</span><span style="color:#0000ff;">&gt;</span>
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
<em>Document.hbm</em>
</p>
<p>
&nbsp;
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">&lt;?</span><span style="color:#800000;">xml</span> <span style="color:#ff0000;">version</span><span style="color:#0000ff;">=&quot;1.0&quot;</span> <span style="color:#ff0000;">encoding</span><span style="color:#0000ff;">=&quot;utf-8&quot;</span>?<span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">hibernate-mapping</span> <span style="color:#ff0000;">xmlns</span><span style="color:#0000ff;">=&quot;urn:nhibernate-mapping-2.2&quot;</span> <span style="color:#ff0000;">assembly</span><span style="color:#0000ff;">=&quot;Example.Domain, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null&quot;</span> <span style="color:#ff0000;">namespace</span><span style="color:#0000ff;">=&quot;Example.Domain&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>   <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">class</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Document&quot;</span> <span style="color:#ff0000;">table</span><span style="color:#0000ff;">=&quot;`Document`&quot;</span> <span style="color:#ff0000;">xmlns</span><span style="color:#0000ff;">=&quot;urn:nhibernate-mapping-2.2&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">id</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Id&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;Int32&quot;</span> <span style="color:#ff0000;">column</span><span style="color:#0000ff;">=&quot;Id&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">generator</span> <span style="color:#ff0000;">class</span><span style="color:#0000ff;">=&quot;identity&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">id</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">property</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Author&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;String&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">column</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Author&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">property</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">property</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Date&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;DateTime&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">column</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Date&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">property</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">property</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Contents&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;String&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">column</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Contents&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">property</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  16:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">property</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Code&quot;</span> <span style="color:#ff0000;">type</span><span style="color:#0000ff;">=&quot;String&quot;</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  17:</span>       <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">column</span> <span style="color:#ff0000;">name</span><span style="color:#0000ff;">=&quot;Code&quot;</span> <span style="color:#0000ff;">/&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  18:</span>     <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">property</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  19:</span>   <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">class</span><span style="color:#0000ff;">&gt;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  20:</span> <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">hibernate-mapping</span><span style="color:#0000ff;">&gt;</span>
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
The interesting part is line 19 - 22 of the <em>Customer</em>.hbm. What this is saying is that there is a relationship of one to many from Customer to Document, indicating the class corresponding to <em>Document</em>. It also indicates that the foreign key in the Document table is <em>Customer_id</em>. To create the database, we can add the attribute <em>DatabaseOperation=&quot;Create&quot; </em>to our MSBuild task and it will create the database for us:
</p>
<p>
&nbsp;
</p>
<p>
<a href="/blogengine/image.axd?picture=WindowsLiveWriter/SpendingtimewithFluentNHibernatePart2_D011/image_6.png"><img style="border-width:0;" src="/blogengine/image.axd?picture=WindowsLiveWriter/SpendingtimewithFluentNHibernatePart2_D011/image_thumb_2.png" border="0" alt="image" width="293" height="392" /></a>
</p>
<p>
&nbsp;
</p>
<p>
<strong>Overriding specific mappings</strong>
</p>
<p>
As you may have noticed, all of the string types are automatically mapped to nvarchar(255). This is what NHibernate does by default if a length attribute isn&#039;t specified in the property mapping. Considering our <em>Contents</em> property for <em>Document </em>requires a larger amount of data to be stored, we need to override this. For these cases, Fluent NHibernate allows you to override a specific mapping of an entity by using the <em>ForTypesThatDeriveFrom </em>method:
</p>
<p>
&nbsp;
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">static</span> AutoPersistenceModel GetMapping()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>      <span style="color:#0000ff;">return</span> AutoPersistenceModel.MapEntitiesFromAssemblyOf&lt;Customer&gt;()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>          .ForTypesThatDeriveFrom&lt;Document&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>            ( m =&gt; m.Map(p =&gt; p.Contents).WithLengthOf(3000));
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span> }
</pre>
</div>
</div>
<p>
&nbsp;
</p>
<p>
In this particular case, we&#039;re telling Fluent Nhibernate, that when mapping <em>Document </em>(and it&#039;s descendants), the property <em>Contents</em> should be mapped with a length of 3000 characters. Any other property not specified will still be mapped using the defaults. Making this change, we&#039;ll end up with a database column of type <em>nvarchar(3000), </em>with everything else, exactly the same.&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
<strong>Summary</strong>
</p>
<p>
In this second part, we defined a relationship between two entities and Fluent NHibernate figured out the rest for us. As we continue with this series, we&#039;ll see that as our entity model becomes more complex there are situations where we have to &quot;help&quot; Fluent NHibernate a little bit with the mappings.&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
<strong>Credits</strong>
</p>
<p>
I&#039;d like to thank <a href="http://www.lostechies.com/blogs/jagregory">James Gregory</a>, not only for the wonderful work he&#039;s doing with Fluent NHibernate, but also for reviewing these entries to make sure I haven&#039;t said something stupid and give the wrong information to my readers.
</p>
