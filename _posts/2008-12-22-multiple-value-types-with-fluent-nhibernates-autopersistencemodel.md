---
layout: post
title: Multiple Value types with Fluent NHibernate's AutoPersistenceModel
categories: []
tags:
- NHibernate
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-12-22 11:01:32'
---
<p>The AutoPersistenceModel in Fluent NHibernate doesn't support values types automatically (yet), but getting them to work isn't that difficult. Take the following example:</p>  <p>&#160;</p>  <div>   <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">     <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Company</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> {   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">int</span> Id { get; set; }   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Name { get; set; }   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> ICollection&lt;Contact&gt; Contacts { get; set; }   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> ICollection&lt;Address&gt; Addresses { get; set; }   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span> }   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Contact   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  10:</span> {  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  11:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> NameFirst { get; set; }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  12:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> NameLast { get; set; }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  13:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Telephone { get; set; }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  14:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Email { get; set; }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  15:</span> }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  16:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  17:</span> <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">class</span> Address   </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  18:</span> {  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  19:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Street { get; set; }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  20:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> City  { get; set; }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  21:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> State { get; set; }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  22:</span>     <span style="color:#0000ff;">public</span> <span style="color:#0000ff;">virtual</span> <span style="color:#0000ff;">string</span> Country { get; set; }  </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  23:</span> }  </pre>
  </div>
</div>

<p>&#160;</p>

<p><strong>Contact</strong> and <strong>Address</strong> are value types, that is, the only way to get to them is via the aggregate root, which is Company. Here's the AutoPersistenceModel of Fluent NHibernate:</p>

<p>&#160;</p>

<div>
  <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> persistenceModel.AddEntityAssembly(assembly)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span>                 .Where(entity =&gt; entity.Namespace == <span style="color:#006080;">&quot;iMeta.Examples.Domain.Entities&quot;</span> &amp;&amp; entity.GetProperty(<span style="color:#006080;">&quot;Id&quot;</span>) != <span style="color:#0000ff;">null</span>)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>                 .WithConvention(convention =&gt; convention.GetForeignKeyName = p =&gt; p.Name + <span style="color:#006080;">&quot;Id&quot;</span>)</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>                 </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>&#160; </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>             .ForTypesThatDeriveFrom&lt;Company&gt;(map =&gt;</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>                                                {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>                                                    map.HasMany&lt;Contact&gt;(t =&gt; t.Contacts).Component( c =&gt;</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span>                                                                                     {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  10:</span>                                                                                         c.Map(t =&gt; t.NameFirst);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  11:</span>                                                                                         c.Map(t =&gt; t.NameLast);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  12:</span>                                                                                         c.Map(t =&gt; t.Telephone);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  13:</span>                                                                                         c.Map(t =&gt; t.Email);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  14:</span>                                                                                     }).AsList();</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  15:</span>                                                    map.HasMany&lt;Address&gt;(t =&gt; t.Addresses).Component(c =&gt;</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  16:</span>                                                                                    {</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  17:</span>                                                                                        c.Map(t =&gt; t.Street);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  18:</span>                                                                                        c.Map(t =&gt; t.City);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  19:</span>                                                                                        c.Map(t =&gt; t.State);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  20:</span>                                                                                        c.Map(t =&gt; t.Country);</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  21:</span>                                                                                    })</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  22:</span>                                                        .AsList();</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  23:</span>                                                    </pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  24:</span>                                                })</pre>

    <pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, &#039;background-color:#f4f4f4;border-style:none;margin:0;padding:0;"><span style="color:#606060;">  30:</span>                .Configure(config);</pre>
  </div>
</div>

<p>&#160;</p>

<p>We are using telling the AutoPersistenceModel that for types that derive from Company (currently there is no support for inheritance but its named like this for future support), map the Contacts and Addresses properties to a collection of components. That simple! </p>

<p>I'm assuming, and hoping, that in future versions this will be supported automatically so there won't be a need for this.&#160; </p>
