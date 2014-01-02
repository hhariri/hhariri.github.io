---
layout: post
title: 'Book Review: Writing and Querying MapReduce Views in CouchDB'
categories: []
tags:
- book review
- couchdb
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704318;}
  _elasticsearch_indexed_on: '2011-02-01 20:46:28'
comments: true
---
<p>This morning I read the book <strong><a href="http://oreilly.com/catalog/0636920018247">Writing and Querying MapReduce Views in CouchDB</a></strong>, and it was literally this morning since it’s quite a short book and very easy read. At just 75 pages and 4 Chapters, the book takes you through the basics of how CouchDB views work. It shows you how to work with Futon and the command line, how to work with persistent and temporary views and explains the principles behind Map and Reduce functions. </p> <p>Being Bradley’s first book (FTR I only met <a href="http://twitter.com/BradleyHolt">Bradley</a> yesterday. Thanks <a href="http://twitter.com/julielerman">Julie</a>), he’s done a pretty good job. His writing is quite clear and to the point. It’s not too wordy (page filler) and that somehow explains how he’s managed to fit quite a bit in such a small amount of pages. </p> <p>The book starts off with an introduction to the basics of working with Views in CouchDB, getting you familiar with Futon and cURL. It then moves on to Chapter 2 where it explains how to create relationships in CouchDB and how to query them obtaining different types of views. One nice thing about this chapter is that it focuses a bit more on Reduce functions, explaining also the built-in functions. Chapter 3 delves into Design Documents and shows how to persist views. Finally Chapter 4 covers querying documents by ranges, grouping, paging and a few more additional topics. Bradley also takes care to point out across the different chapters some of the gotcha’s and limitations of CouchDB Views and offers small hints on alternative approaches. </p> <p>As I mentioned, the book was an easy read and I’d recommend it to people new to CouchDB. </p> <p>However, I think there’s room for expansion. Most people using CouchDB or any of the NoSQL products, comes from a SQL background. As such, they (we) are accustomed to looking at data in a relational way and querying it the way it should be in a relational model. Map/Reduce however is different and we need to think about things differently. This is where the major issues are for new comers. </p> <p>What I’d really love from this book is how to deal with these situations, how to take common scenarios, and not only explain how to <em>do </em>this in CouchDB, but why it does not always make sense to <em>do it that way </em>and show how to approach problems in a different manner, something that makes more sense in the non-relational world.</p>
