---
layout: post
title: Android applications with Kotlin
categories:
- JetBrains
tags:
- JetBrains
- Kotlin
status: publish
type: post
published: true
meta:
  _publicize_pending: '1'
  _elasticsearch_indexed_on: '2013-05-21 06:07:45'
---
Did you know you can write applications for Android using <a href="http://kotlin.jetbrains.org">Kotlin</a> instead of Java? Here's how, in one minute!

[youtube https://www.youtube.com/watch?v=SznPkYHGxLY&amp;w=560&amp;h=315]
<h2>Converting to Kotlin</h2>
IntelliJ offers a series of features targeted at Android development, among these is the ability to quickly create Android Components:

<img title="NewMenu.png" alt="NewMenu" src="http://hhariri.files.wordpress.com/2013/05/newmenu.png" width="211" height="300" border="0" />

For instance, selecting to create a new Activity will generate the corresponding XML layout, source file and update and the application manifest. Quite useful. The problem is though that the source generated is in Java, which isn't an issue of course unless you're working with Kotlin. However, you can easily work around this. Simply use IntelliJ's helper to create the necessary components, then select the generated Java file in the Project window and from the <em>Code</em> menu click on <em>Convert Java File to Kotlin File</em> (there's a different shortcut depending on your keyboard layout).

<img style="border:0;" title="CodeMenu.png" alt="CodeMenu" src="http://hhariri.files.wordpress.com/2013/05/codemenu.png" width="320" height="235" border="0" />

All this functionality is available in both <a href="http://www.jetbrains.com/idea/">IntelliJ Ultimate as well as the free OSS IntelliJ Community Edition</a>, the same one <a href="http://android-developers.blogspot.com.es/2013/05/android-studio-ide-built-for-android.html">Android Studio</a> is built on.
