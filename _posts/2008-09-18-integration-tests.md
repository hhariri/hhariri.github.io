---
layout: post
title: Integration Tests
categories: []
tags: []
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-09-18 10:40:50'
---
<p>Two teams work on two different components of a project. Team A works on component A, and to keep things simple, Team B works on component B. The system needs both components to function. </p>  <p>There's an additional catch. Team A needs component B to test A. Team B needs component A to test B.</p>  <p>So what to do? Well they would do what any good team would. Team A goes on holiday while Team B finishes and then Team B relaxes. Unfortunately that isn't always possible.&#160; </p>  <p>Instead, they would use mocks, whether they create their own stubs/fakes or use an existing framework. To verify that component A works, Team A uses mocks to replace component B's functionality. Team B uses mocks to replace component A's functionality. All tests pass.</p>  <p>The next step would be to integrate the two subsystem and put it in production. I mean surely if all subsystem tests pass, it should work......the reality is it probably won't.</p>  <p>&#160;</p>  <p><strong>The moral of the story</strong>: Two halves don't necessarily make a whole. Don't skip your integration tests. It's not a waste of time. And integration tests aren't just about running all your unit tests on a continuous integration server. They are <em>integration tests</em>, not isolated unit tests.</p>
