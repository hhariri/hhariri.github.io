---
layout: post
title: 'Spending time with Fluent NHibernate: Part 1'
categories: []
tags:
- NHibernate
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-03-25 08:52:00'
---
<p>
A couple of days ago, there was a <a href="http://codebetter.com/blogs/howard.dierking/archive/2009/03/22/an-evening-with-fluent-nhibernate.aspx">post</a> by <a href="http://codebetter.com/blogs/howard.dierking/">Howard Dierking</a> covering the topic of Fluent NHibernate. What caught my attention was one of the comments:
</p>

<blockquote>

	<p>
	I find this a little weird... isn&#039;t it so that in general, nhibernate supporters loath the &#039;domain model following the database tables&#039; approach, while to get automapping, you practically have to? ;)
	</p>

	<p>
	About the PI issue: there&#039;s no such thing as persistance ignorance: whatever persistence logic you&#039;re using, it bleeds into your own code one way or the other, be it a base class, be it requirements how to define properties/members, be it how to deal with 2-sided relationships etc.
	</p>

	<p>
	&nbsp;
	</p>

</blockquote>

<p>
I want to focus the following series of posts on showing what Fluent-NHibernate (NHibernate) is truly about, and let you be the judge of whether the previous comment is correct or not. My stand on it is that it&#039;s not.
</p>

<p>
So without further ado, let&#039;s start by the basics.
</p>

<p>
[Note: Due to time limitations and also to keep posts short, I will try and focus on small sections on each post]
</p>

<p>
&nbsp;
</p>

<p>
<strong>NHibernate 101 in one paragraph</strong>
</p>

<p>
For those new to NHibernate, it is an ORM framework (Object Relation Mapper). ORM&#039;s try and eliminate the impedance mismatch that exists between Object Orientated programming and Relational Databases. This allows developers to work with objects and not have to worry about how these objects are persisted to disk in a relational database (i.e. tables, joins, etc.). Other examples of ORM&#039;s include LLibGenPro, Linq to Sql, and of course Entity Framework (although some people claim that EF is MORE than a ORM, but each to their ow).
</p>

<p>
&nbsp;
</p>

<p>
<strong>Mapping in NHibernate</strong>
</p>

<p>
One of the main problems with any ORM is that there is considerable amount of time spent mapping objects to their corresponding tables in a database. Imagine the following class:
</p>

<div>

<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">

<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Customer
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">int</span> Id { get; <span style="color:#0000ff;">private</span> set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> NameFirst { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> NameLatst { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Telephone { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Email { get; set; }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span> }
</pre>
</div>
</div>
<p>
This needs to be stored in the database somehow, and to do so, the framework (in our case NHibernate), needs to know how to match objects to tables and properties to columns. To solve this, NHibernate uses the concept of mapping files (hbm), which are non other than XML files with specific tags:
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> &lt;?xml version=<span style="color:#006080;">&quot;1.0&quot;</span> encoding=<span style="color:#006080;">&quot;utf-8&quot;</span> ?&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span>&nbsp; &lt;hibernate-mapping xmlns=<span style="color:#006080;">&quot;urn:nhibernate-mapping-2.2&quot;</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>    <span style="color:#0000ff;">namespace</span>=<span style="color:#006080;">&quot;Examples.Domain&quot;</span> assembly=<span style="color:#006080;">&quot;Examples.Domain&quot;</span>&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>   &lt;<span style="color:#0000ff;">class</span> name=<span style="color:#006080;">&quot;Customer&quot;</span> table=<span style="color:#006080;">&quot;Customer&quot;</span>&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>      &lt;id name=<span style="color:#006080;">&quot;Id&quot;</span>&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>       &lt;generator <span style="color:#0000ff;">class</span>=<span style="color:#006080;">&quot;identity&quot;</span> /&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>      &lt;/id&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>      &lt;property name=<span style="color:#006080;">&quot;NameFirst&quot;</span>/&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>      &lt;property name=<span style="color:#006080;">&quot;NameLast&quot;</span>/&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>      &lt;property name=<span style="color:#006080;">&quot;Telephone&quot;</span>/&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>     &lt;property name=<span style="color:#006080;">&quot;Email&quot;</span>/&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>  &lt;/<span style="color:#0000ff;">class</span>&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>&lt;/hibernate-mapping&gt;
</pre>
</div>
</div>
<p>
The configuration is pretty self-explanatory. You define the name of the class, the corresponding table name you want in the database, and then start to define a series of properties. NHibernate follows a series of conventions, so for example if a column attribute is not specified in the property element, the corresponding column name in the database table will be the same as that of the property. The same thing happens with the type of the property, again, NHibernate internally maps CLR types to database types.
</p>
<p>
One of the problems with this type of mapping is that you don&#039;t get type-safety. If you make a mistake in writing out a column name you won&#039;t know of the issue until runtime. The other problem occurs when you are trying to refactor your code. If you don&#039;t have special add-ons such as <a href="http://www.jetbrains.com">Resharper</a> (and if you don&#039;t, what are you waiting for?), refactoring XML files is pretty much a no-no in Visual Studio. Imagine the scenario: you rename NameFirst to FirstName and forget to do it in your mapping file. Your application will still compile, but come runtime, kaboom!
</p>
<p>
&nbsp;
</p>
<p>
<strong>Fluent-NHibernate</strong>&nbsp;
</p>
<p>
This is where Fluent-NHibernate enters the picture. This project was initially built to allow for developers to map their entities to tables in code, i.e. using C#.
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> 1. <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Customer : ClassMap&lt;Customer&gt;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span> 2. {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span> 3.   <span style="color:#0000ff;">public</span> Customer()
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span> 4.   {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span> 5.     Id(x =&gt; x.Id);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span> 9.     Map(x =&gt; x.NameFirst);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span> 9.     Map(x =&gt; x.NameLast);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span> 9.     Map(x =&gt; x.Telephone);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span> 9.     Map(x =&gt; x.Email);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span> 2.   }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span> 3. }
</pre>
</div>
</div>
<p>
Already this provides benefits. By allowing this, you get away from the magic strings in the mapping files, allowing not only for compile-time checking but also refactoring.
</p>
<p>
However, one thing still remains, mapping. You still have to map your classes. Now, during both the mapping using XML as well as C#, have you noticed one thing? A series of assumptions are made. We said previously that you don&#039;t need to specific column names or types, etc. These are conventions. NHibernate assumes a series of conventions. Following the 80/20 rule, assuming that 80% of the time these conventions suit our applications, there&#039;s a remaining 20% that would&nbsp; need some sort of adjustment.
</p>
<p>
&nbsp;
</p>
<p>
<strong>Auto Persistence Model</strong>
</p>
<p>
Say Hello to the Auto Persistence Model in Fluent-NHibernate. By latching on to the concept of convention over configuration, the Auto Persistence facilities in Fluent-Nhibernate do the mapping for you. This makes a series of decisions and maps your classes to their corresponding database tables and columns. Yet at the same time it&nbsp; allows you to tweak these conventions. This then gives us 100% coverage. For 80% of the time, the APM is fine, and for those special cases we adjust the conventions to our needs. Here is the same mapping using the Auto Persistence Model in Fluent-NHibernate:
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> AutoPersistenceModel.MapEntitiesFromAssemblyOf&lt;Customer&gt;().Configure(config);
</pre>
</div>
</div>
<p>
AutoPersistenceModel has a static method MapEntitiesFromAssemblyOf where you pass in a specific type. Since my current example only has one type, namely Customer, I&#039;m passing this one in. It takes this assembly and loads all the types it contains and create the NHibernate mappings for you. It places these mappings into a NHibernate Configuration class (the <em>config </em>parameter).
</p>
<p>
So far, the code for the simple example project is limited to the Customer class and the single isolated line of code that generates the mapping using Fluent-NHibernate&#039;s Auto Persistence Model. However, on it&#039;s own it&#039;s pretty useless. We need to somehow tie it to a database (that doesn&#039;t exist yet) so that we can actually make use of it. To do so, we create a Mapper class that generates the mappings and returns the NHibernate configuration:
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">static</span> <span style="color:#0000ff;">class</span> Mapper
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span>    {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>        <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">static</span> Configuration GenerateMapping(<span style="color:#0000ff;">string</span> connectionString)
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>        {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>            var config = MsSqlConfiguration.MsSql2005
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>                .ConnectionString(c =&gt; c.Is(connectionString))
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>                .ConfigureProperties(<span style="color:#0000ff;">new</span> Configuration());
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>            AutoPersistenceModel.MapEntitiesFromAssemblyOf&lt;Customer&gt;().Configure(config);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>            <span style="color:#0000ff;">return</span> config;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>        }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  16:</span>    }
</pre>
</div>
</div>
<p>
What this class is doing, is create a NHibernate configuration that is based on Microsoft SQL Server (2005 and up) and configures a series of default properties. The only parameter it requires is the connection string. It generates the the mapping files and returns the configuration to us. Next step is to make use of this configuration. Remember, right now we have the mappings, but we don&#039;t actually have any underlying database. We don&#039;t know anything about how the structure is or should be.
</p>
<p>
&nbsp;
</p>
<p>
<strong>Creating the database</strong>
</p>
<p>
In the NHibernate framework, there is a namespace called <em>hbm2ddl </em>which as it&#039;s name indicates, can create DDL from mapping files. That is precisely what we need. To use it, it&#039;s as simple as passing in a NHibernate configuration to the <em>SchemaExport</em> class:
</p>
<div>
<div style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;padding:0;">
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   1:</span> <span style="color:#0000ff;">using</span> NHibernate.Tool.hbm2ddl;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   2:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   3:</span> <span style="color:#0000ff;">namespace</span> Example.DBGenerator {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   4:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   5:</span>
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   6:</span>     <span style="color:#0000ff;">class</span> Program
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   7:</span>     {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   8:</span>         <span style="color:#0000ff;">static</span> <span style="color:#0000ff;">void</span> Main(<span style="color:#0000ff;">string</span>[] args)
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">   9:</span>         {
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  10:</span>             var config = Mapper.GenerateMapping(args[0]);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  11:</span>&nbsp;
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  12:</span>             <span style="color:#0000ff;">new</span> SchemaExport(config).SetOutputFile(args[1]).Create(<span style="color:#008000;">/* Output to console */</span> <span style="color:#0000ff;">false</span>, <span style="color:#008000;">/* Execute script against database */</span> <span style="color:#0000ff;">true</span>);
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  13:</span>         }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  14:</span>     }
</pre>
<pre style="overflow:visible;font-size:8pt;width:100%;color:black;line-height:12pt;font-family:consolas,'Courier New',courier,monospace;background-color:white;border-style:none;margin:0;padding:0;">
<span style="color:#606060;">  15:</span> }
</pre>
</div>
</div>
<p>
Ignoring the fact that there is absolutely no error checking in this application whatsoever, all we are doing is taking the our configuration generated by the mapper and passing it to our SchemaExport class, which is calling the Create method to create the SQL, dump it into a file and at the same time, generate it for us in SQL Server. Running this executable with the following command line:
</p>
<p>
&quot;Data Source=.\SQLEXPRESS;Initial Catalog=FluentExample;Integrated Security=true&quot; Output.sql
</p>
<p>
we get:
</p>
<p>
&nbsp;<a href="http://www.hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SpendingtimewithFluentNHibernatePart1_7BD8/image_2.png"><img style="border:0 none;" src="http://www.hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SpendingtimewithFluentNHibernatePart1_7BD8/image_thumb.png" border="0" alt="image" width="392" height="360" /></a>
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
In this first post, I wanted to show you how you can easily create a domain model and have the corresponding database created for you automatically, without having to worry about any types of mappings, let alone database structures. However, I&#039;ve only touched the tip of the iceberg. In the next series of posts, we&#039;ll drill down into everything Fluent-NHibernate has to offer us.
</p>
<p>
Coming back to the original comment, what do you think? Did I start with my domain object or my database? This is what true persistence ignorance is about!
</p>
