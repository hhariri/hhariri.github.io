---
layout: post
title: 'FYI: Check Digit'
categories: []
tags: []
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-01-11 07:57:48'
comments: true
---
In Spain, bank accounts have twenty digits, two of which represent the check digits (known in Spanish as "Digito de Control"). The purpose of a check digit is to perform a validation of a value. In this case, we have four digits representing the bank, four representing the branch, ten for the actual account number and last but definitely not least, the two check digits. It's important to have them since you can often get confused why typing in twenty numbers and find you have incorrectly put in a two instead of a three. You don't want the 1M Euros to be transferred to the wrong account.

Now any good system should verify the check digit and notify the user if it's incorrect. That's what my bank does. However, mine goes one step further. It actually tells me what the correct control digit is!!! @#!??!. Only one scenario comes to mind where that would be useful. Otherwise I think it can cause more harm than good.

<a href="http://hhariri.files.wordpress.com/2008/01/5.png"><img class="alignnone size-full wp-image-650" title="5" src="{{ site.images }}/check-1.png" alt="" width="244" height="150" /></a>

[Translation: the check digit is incorrect. It should be 41]
