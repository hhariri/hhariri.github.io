---
layout: post
title: Linq to Sql is dead. Did you abstract well?
categories: []
tags:
- Architecture
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-11-01 07:53:00'
comments: true
---
<p>
Here&#039;s an <a href="http://blogs.msdn.com/adonet/archive/2008/10/29/update-on-linq-to-sql-and-linq-to-entities-roadmap.aspx">update
on the roadmap</a> for Linq2Sql. The post is pretty much confirming that they&#039;re
killing off the project.
</p>
<p>
A project we started recently, we had to make a choice of which ORM to use.
Since Entity Framework wasn&#039;t still up to par (and in certain aspects probably
still isn&#039;t), and the team had experience with Linq2Sql, we decided to use that.
However, from day one, we made a conscientious choice of not leaking anything of
L2S into our domain objects.
</p>
<p>
This meant that we didn&#039;t use the L2S objects, but in turn used our own POCO
classes. Therefore the sole purpose of L2S was to map data from the DB, what the
job of an ORM is. Recently, and before the announcement, we found a lot of
shortcomings when working with L2S and aggregate roots (I won&#039;t get into the
details since <a href="http://blogs.imeta.co.uk/sstrong">Steve</a> is planning a
series of posts on the subject and how to handle aggregate roots with the
different existing ORM&#039;s). We&#039;ve therefore decided to switch ORMs. The beauty of
it is that because of the clear abstraction of L2S, it&#039;s going to be very easy
to swap out L2S for another ORM.
</p>
<p>
Now that we have confirmation that L2S isn&#039;t going anywhere, if you have
issues with the current version and were hoping to get them resolved in a future
release, I guess you&#039;re out of luck. So the time comes to move on. If you&#039;ve
abstracted well, it shouldn&#039;t hurt that much.
</p>
<p>
Obviously if you don&#039;t have issues with L2S and no projections on needing new
features, then stick to what you have. &quot;If it ain&#039;t broken, don&#039;t fix it&quot;. But
don&#039;t start any new projects with it. Even Microsoft don&#039;t recommend it
anymore.
</p>
<p>
&nbsp;
</p>
