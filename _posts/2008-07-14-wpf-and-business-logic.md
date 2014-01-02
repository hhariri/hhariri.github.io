---
layout: post
title: WPF and Business Logic
categories: []
tags:
- Architecture
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-07-14 10:50:00'
comments: true
---
<p>I read <a href="http://www.hanselman.com/blog/LearningWPFWithBabySmashMVCOrMVPAndTheBenefitsOfADesigner.aspx">something interesting</a> on Scott Hanselman&#039;s blog the other day regarding WPF. It was in relation to activating and dis-activating some controls based on the value of other ones. And I &quot;quote&quot;:    <br /><a href="/blogengine/image.axd?picture=WindowsLiveWriter/WPFandBusinessLogic_A673/%7B%25URL.DOC.png"><img style="border-color:initial;border-style:initial;border-width:0;" src="/blogengine/image.axd?picture=WindowsLiveWriter/WPFandBusinessLogic_A673/%7B%25URL.DOC_thumb.png" border="0" alt=" URL.DOC" width="244" height="136" /></a></p>  <p>His proposed solution is taking advantage of WPF&#039;s extremely powerful binding capabilities. I &quot;quote&quot; again:</p>  <p><a href="/blogengine/image.axd?picture=WindowsLiveWriter/WPFandBusinessLogic_A673/%7B%25URL.DOC_1.png"><img style="border-color:initial;border-style:initial;border-width:0;" src="/blogengine/image.axd?picture=WindowsLiveWriter/WPFandBusinessLogic_A673/%7B%25URL.DOC_thumb_1.png" border="0" alt=" URL.DOC" width="244" height="87" /></a></p>  <p>He&#039;s happy with that. I&#039;m not! He&#039;s putting business logic inside the view. And it scares me to see things like this because it tends to non-testable and &quot;obscure&quot; problems.</p>
