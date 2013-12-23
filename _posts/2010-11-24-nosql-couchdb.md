---
layout: post
title: Is NoSQL for me? I’m just a small fish
categories:
- General
tags: []
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704326;}
  _wpas_skip_twitter: '1'
  _elasticsearch_indexed_on: '2010-11-24 09:36:11'
---
Many big players are using NoSQL as their storage mechanism. When reading or hearing about NoSQL, names such as Google, Facebook or Amazon are brought up. And why not? I mean surely if they’ve gone down the road of NoSQL and things are working out for them, despite the occasional hiccup, it must be good. It provides credibility.

What can often be viewed as a major “selling” point of NoSQL however, can also do it disservice to an extent. See, when people hear about success stories like this, they sometimes discard the NoSQL option, thinking that they’re just a small shop doing typical Line of Business applications for their customers. They don’t have the users or demands that companies such as Facebook have. As such, they stay within their comfort zone of relational systems, bearing the pains. That doesn’t necessarily have to be the case. NoSQL is viable for small, medium and large fish.
<h3>I didn’t have scaling issues, I had maintainability nightmares.</h3>
I’ve been writing LOB applications for as long as I can remember. With regard to data access I’ve gone from Clipper, to embedded SQL, to Drag and Drop, hand-rolled ORM’s and OSS/Commercial ORM’s.

Lately, with ORM’s, each time I started a new application, I would dread having to set up mapping of entities to tables. Granted that many solutions out there helped (AutoPersistenceModel from FluentNH helped a lot!), but it still bugged me. There were always edge-cases. There were always some things that just couldn’t be done easily.

And then of course the migrations! And I’m not talking about migrations during development, but deployment. Alter table, Drop Column. No. OK. Alter table, Add Column, Copy Data. Drop Column. No. Crap. Alter table. Drop Constraint. No. I’m sure we’ve all been there, and we’ve all solved it one way or another, and with certain success, but still it bugged me.

I wanted to look for something different, something that would allow me to seriously not have to worry so much about these things. Something I could just stuff some data in to and get it out. That’s what made me look at document databases, and in particular CouchDB. The main thing that attracted me to NoSQL, wasn’t that it was scalable, but that it was schema-less*. I could store whatever I wanted. I didn’t have to worry about violating some constraint**. It was the Mapping and Migrations I wanted to get rid of. Removing many of the issues associated with mappings and migrations, maintenance has become simpler, which in turn has provided me with more flexibility in design.

But I’ve also obtained other advantages. CouchDB is based on HTTP and embraces it as an application protocol (we could say it complies with <a href="http://martinfowler.com/articles/richardsonMaturityModel.html">Level 2 of Richardson’s Maturity Model</a>). It uses HTTP status codes, cache infrastructure and other benefits of the web infrastructure that is already proven and in place to offer power and simplicity in design. As someone that loves HTTP, for me this has been a win-win situation.

It has also opened up the door for me to write disconnected applications. By providing support for numerous platforms (including Android) and it’s powerful master-master replication mechanism, it allows me to easily write offline applications that can sync when connected.

CouchDB offers me authentication, authorization, validation. In fact based usage scenarios, you don’t even need to use a client to access CouchDB. Many still don’t realize but CouchDB is a fully-fledged application server. You can create views, listing, data input, all with the same server.

So what started out as just a reason to remove mappings has proven much more fruitful.
<h3>Persistence Ignorance has shifted</h3>
Although it might seem so at first, it’s not all a bed of roses however. I always mention in my presentations on CouchDB, that as much as we strived to accomplish Persistence Ignorance when working with ORM’s, when it comes to using a NoSQL solution, we can’t be ignorant about our persistence mechanism, from an architectural perspective. Depending on what we need, how we need to store the information, and how we need to query it, are factors that play an important role in the solution we opt for. This applies not only to when choosing the NoSQL solution, but also when persisting information. It is true that joins and complex queries have disappeared in Document databases, but relationships between objects in the real world have not, and based on how we need to work with this information, different techniques can should be applied.

Some of the benefits I’ve outlined here are specific to CouchDB. Other NoSQL solutions offer different advantages. It depends on what you’re looking for is where you’d pick one or another.  However, don’t be fooled into thinking that the only thing NoSQL has to offer is scalability. There’s a whole lot more that you can gain.

As an added bonus of course, when your application does hit the big time, it might even scale.

* When I talk about schema-less here I'm referring to the rigid column structure that traditional relational storage systems enforce us into following (i.e. defining columns beforehand). Most document databases including CouchDB and RavenDB do in fact store schema with each document. By using JSON, each document is self-describing, so technically there is a schema. It's just not "fixed".

** For all those obsessed with imposing constraints on the storage mechanism, you can do this with CouchDB if you want.
