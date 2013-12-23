---
layout: post
title: 'The Kotlin Journey Part III: Wrapping up classes'
categories:
- General
- JetBrains
tags:
- Kotlin
status: publish
type: post
published: true
meta:
  draftfeedback_requests: a:2:{s:28:"andrey.breslav@jetbrains.com";a:3:{s:3:"key";s:13:"500aa03a924d6";s:4:"time";s:10:"1342873658";s:7:"user_id";s:7:"5078411";}s:19:"mail@hadihariri.com";a:3:{s:3:"key";s:13:"500aa03ae1e8e";s:4:"time";s:10:"1342873658";s:7:"user_id";s:7:"5078411";}}
  draft_feedback: |-
    a:1:{s:28:"andrey.breslav@jetbrains.com";a:1:{i:0;a:2:{s:4:"time";s:10:"1342900241";s:7:"content";s:617:"* We keep to the Java convention of naming properties and functions with lowercase first letter.

     On "override": there is a body, but it is an empty block. This method is not abstract, it can be invoked. Actually, this is not important. Every function/property that overrides something (even if it keeps it abstract) should be annotated with "override" to prevent problems of erroneous manual refactoring + for clarity. (This is why we have the @Override annotation in Java).


    On delegation: if something has too many supertypes in any language its code looks funny. And I agree about the code smell for most cases.";}}}
  _wpas_skip_twitter: '1'
  _elasticsearch_indexed_on: '2012-07-21 12:24:05'
---
This is a multi-part series on Kotlin, a new statically typed language from JetBrains targeting the JVM and JavaScript

<a href="http://hadihariri.com/2012/02/17/the-kotlin-journey-part-i-getting-things-set-up/">Part I: Getting things set up</a>
<a href="http://hadihariri.com/2012/03/10/the-kotlin-journey-part-ii-a-premier-on-classes/">Part II: A primer on classes</a>
<a href="http://hadihariri.com/2012/07/21/the-kotlin-journeypart-iii-wrapping-up-classes/">Part III: Wrapping up classes</a>
<a href="http://hadihariri.com/2012/09/27/the-kotlin-journey-part-iv-adding-functionality" target="_blank">Part IV: Adding functionality</a>

A quick update on constructors

In Part II we discussed constructors and saw how to intialize properties based on constructor parameters, a somewhat typical scenario. Kotlin M2 (milestone 2) now supports declaration of properties directly via the constructor. What this means is that we can shorten the following code

<a href="http://hhariri.files.wordpress.com/2012/07/image15.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="image" src="http://hhariri.files.wordpress.com/2012/07/image_thumb15.png" alt="image" width="409" height="143" border="0" /></a>

to

<a href="http://hhariri.files.wordpress.com/2012/07/image16.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="image" src="http://hhariri.files.wordpress.com/2012/07/image_thumb16.png" alt="image" width="396" height="136" border="0" /></a>

This provides us with the properties as before but saves a few extra lines of redundant code. Another change is that constructors can now have optional parameters, meaning that a class only ever requires a single constructor, so there is no constructor overload.
<h3>final by default</h3>
The base class for a class in Kotlin is <em>Any</em>, a class that does not have any methods or properties. In Kotlin, classes and methods are final (or sealed for C# developers) by default. This is one of the somewhat controversial decisions of Kotlin, and still is not 100% final. The reason for this however is because it is somewhat accepted that one has to design for extensibility consciously.

In order to inherit from a class or override a method, we need to explicitly mark them as <em>open. </em>

<a href="http://hhariri.files.wordpress.com/2012/07/image10.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="image" src="http://hhariri.files.wordpress.com/2012/07/image_thumb10.png" alt="image" width="356" height="298" border="0" /></a>

The base class <em>Person </em>as well as the method c<em>anOverride </em>are declared as <em>open </em>which allows us to inherit from <em>Person</em> and override c<em>anOverride</em>. In the inherited <em>Employee</em> class we define overridden method as <em>final</em> which means that inherited classes can no longer override this method.

From the inherited class we can refer to the base class using <em>super </em>(highlighted in the image)<em>. </em>Also important to note is that constructors are not inherited. To call a constructor on a base class we merely do so after the colon, as shown above.
<h3>Traits, not interfaces</h3>
Kotlin does not have interfaces, instead it has traits, which can be thought of as interfaces with optional method implementations. Traits are open by default, as opposed to classes, and to avoid major pitfalls of multiple inheritance, they cannot hold state. As such, they cannot have properties [Edited (27/12/2012): Abstract properties ARE allowed in traits. <a href="https://twitter.com/DmitryOsinovsky">Thanks Dmitry for pointing this out</a>].

For all practical purposes, a trait is like an interface: we declare a series of methods and have a class implement these

<a href="http://hhariri.files.wordpress.com/2012/07/image11.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="image" src="http://hhariri.files.wordpress.com/2012/07/image_thumb11.png" alt="image" width="306" height="330" border="0" /></a>

Notice how b<em>roadcast </em>does not need to be implemented. Another difference as opposed to interfaces is that we need to explicitly indicate the <em>override </em>directive.
<h2>A word on abstracts</h2>
Kotlin also allows for abstract classes and methods, like many other languages, and much like these, we merely have to prefix the class with the keyword <em>abstract. </em>
<h3>First class delegation</h3>
Composition over inheritance is a common design practice to follow, as large inheritance chains come with their own series of issues. When composing classes, it is also considered good practice to use dependency injection, so as to allow for multiple implementations. A typical scenario would be

<a href="http://hhariri.files.wordpress.com/2012/07/image17.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="image" src="http://hhariri.files.wordpress.com/2012/07/image_thumb17.png" alt="image" width="381" height="254" border="0" /></a>

We define a <em>CustomerRepositoryTrait </em>and then inject a specific implementation in our controller. All operations that have to do with the customer repository are now delegated and accessed via the property c<em>ustomerRepo</em>.

Kotlin goes one step further and inherently understands delegation. As such, the previous code could be written like so

<a href="http://hhariri.files.wordpress.com/2012/07/image18.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="image" src="http://hhariri.files.wordpress.com/2012/07/image_thumb18.png" alt="image" width="376" height="138" border="0" /></a>
<p align="left">We are telling the compiler that the functionality of the trait is delegated to the injected parameter. One benefit is that we no longer have to explicitly create a property to hold a reference to the dependency. This also has an impact on how we use the code, as we no longer need to dereference it via the dependency, but call it directly. Some might think that this could potentially cause an issue when a class has too many delegated responsibilities. What call belongs to what trait? In actual fact, that usually is a sign of a class doing too much and as such breaking SRP. So think of this more as a warning, a smell.</p>

<h3>enums are classes</h3>
One of the great features of Kotlin is that enums are classes. This can come in very handy when trying to add behavior.

<a href="http://hhariri.files.wordpress.com/2012/07/image14.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="image" src="http://hhariri.files.wordpress.com/2012/07/image_thumb14.png" alt="image" width="347" height="343" border="0" /></a>

The <em>CustomerState </em>class is an enum type which provides three values: SIGNED_UP, NORMAL and PREFERRED. What it also provides however is a method called f<em>ormatted</em> that is defined as abstract. We can now leverage this and override the method for each of the enum values.

Note that methods on enums do not necessarily have to be abstract or open.
<h3>Summary</h3>
We can see that inheritance in Kotlin is pretty straightforward. We have <em>abstract</em> classes, <em>open </em>classes and <em>traits</em>, which are open by default. Methods can also be abstract, open and final. There’s also the notion of first class delegation using the <em>by </em>keyword. In the next part we’re going to dive deeper into functions!
