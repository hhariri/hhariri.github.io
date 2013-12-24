---
layout: post
title: 'The Kotlin Journey Part II: A primer on classes'
categories:
- General
- JetBrains
tags:
- JetBrains
- Kotlin
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1386313011;}
  _wpas_skip_twitter: '1'
  _elasticsearch_indexed_on: '2012-03-10 22:25:41'
---
This is a multi-part series on Kotlin, a new statically typed language from JetBrains targeting the JVM and JavaScript

<a href="http://hadihariri.com/2012/02/17/the-kotlin-journey-part-i-getting-things-set-up/">Part I: Getting things set up</a>
<a href="http://hadihariri.com/2012/03/10/the-kotlin-journey-part-ii-a-premier-on-classes/">Part II: A primer on classes</a>
<a href="http://hadihariri.com/2012/07/21/the-kotlin-journeypart-iii-wrapping-up-classes/">Part III: Wrapping up classes</a>
<a href="http://hadihariri.com/2012/09/27/the-kotlin-journey-part-iv-adding-functionality" target="_blank">Part IV: Adding functionality</a>

A small but important note

Kotlin is still work in progress and not all design decisions are final. That is why your feedback is fundamental. So please provide any feedback via this blog, via our <a href="http://devnet.jetbrains.com/community/kotlin;jsessionid=56D23D3BF26C11C798EE753D17D2844D?view=discussions">forums</a>, via <a href="http://twitter.com/project_kotlin">twitter</a> on what you like, what you dislike.
<h3>Declaring variables</h3>
Before diving into classes, let's first see how we can declare variables in Kotlin, as we'll eventually need to do so when creating an instance of our class.
In Kotlin, variables can be declared in one of two ways, using the <em>var</em> or <em>val</em> keyword:
<ul>
<ul>
	<li><em>var</em> declares a variable that is mutable, that is, the value can change after it has been assigned</li>
</ul>
</ul>
<img src="{{ site.images }}/kj2-1.jpg" alt="201203101930.jpg" width="241" height="71" />
<ul>
<ul>
	<li><em>val</em> declares a variable that is immutable, that is, once assigned the value cannot change</li>
</ul>
</ul>
<img src="{{ site.images }}/kj2-2.jpg" alt="201203101929.jpg" width="207" height="82" />

Notice that we have not declared the type. Much like the <em>var</em> keyword in C#, since the variable has been initialized, the compiler can infer the type. However, if we do not initialize the variable, we need to explicitly define the type:

<img src="{{ site.images }}/kj2-3.jpg" alt="201203101935.jpg" width="166" height="50" />

What happens however when we declare an immutable type that has not been initialized?

<img src="{{ site.images }}/kj2-4.jpg" alt="201203101936.jpg" width="288" height="131" />

As expected, the compiler will allow us to set the value, but not change it. So all is good.

Knowing now the difference between <em>val</em> and <em>var</em>, let's move on and look at classes.
<h3>Classes</h3>
Classes are the main building blocks for many object-orientated programming languages, and as such, of Kotlin also. An empty class declaration looks pretty much like that in C# and Java

<img src="{{ site.images }}/kj2-5.jpg" alt="201203101845.jpg" width="217" height="85" />

(If you're using IntelliJ, you will see items highlighted in the gutter with an icon and letter. In this case C represents Class)

Classes can be <em>public</em>, <em>private</em>, <em>protected</em> or <em>internal</em>. <strong>By default they are <em>internal</em> to modules</strong> (we'll cover what modules and accessibility levels are later). This has the initial apparent disadvantage that you would not be able to test your code from outside a module. The team is currently working on a solution for this which would involve building modules in a specific way that would allow test projects to call internal classes. The approach however will not be the same as in C# where the attribute <em>internalsVisibleTo</em> is required.
To use a class, we merely create an instance of it. <em>new</em> keyword does not exist in Kotlin. A constructor call is similar to a function call.

<img src="{{ site.image }}/kj2-6.jpg" alt="201203101957.jpg" width="223" height="41" />

Note that this customer has a default constructor that takes no parameters, which in Kotlin is a known as the <em>primary</em> constructor. We can override this primary constructor by defining a constructor as part of the class definition

<img src="{{ site.images }}/kj2-7.jpg" alt="201203102138.jpg" width="434" height="196" />

with the actual implementation contained inside the anonymous initializer. This anonymous initializer is actually only necessary when we need certain logic. If we are merely using the constructor to initialize properties, we do not need it.

Now that we know how to create a class and define constructors, let's add some contents to the class.
<h4>Properties</h4>
Usually classes in C# and Java are composed of fields, properties, methods and nested classes. In Kotlin, classes can contain properties, methods, nested classes and object declarations. We'll cover this last one further along in the series. However, the key thing here to notice is that <strong>Kotlin does not allow fields</strong>. As such, everything is a property. It can be internal (default), private, protected or public.

<img src="{{ site.images }}/kj2-8.jpg" alt="201203102223.jpg" width="311" height="152" />

Here we have one internal property and two public ones. Notice how the internal one does not have an explicit type declaration. It is not needed. However, if we were to remove the type declaration for one of the public properties, we'd get a compiler error

<img src="http://hhariri.files.wordpress.com/2012/03/201203102228.jpg" alt="201203102228.jpg" width="356" height="151" />

The reason for this is to prevent unintentional breakage of a public API, since it's much more likely to change the type of a property without realizing the impact it might have if it's not explicit. Another thing to notice is that all properties require explicit initialization, irrelevant of their accessibility or whether they are mutable (<em>var</em>) or immutable (<em>val</em>).
<h4>Was that an AutoProperty?</h4>
If you're a C# developer you're no doubt familiar with the autoproperties, whereby the compiler internally has a backing field holding the value of a property, without requiring you to define explicit getters and setters unless you want to define explicit behavior. Kotlin is pretty much the same in that way and what we just saw uses an internal backing field which is called the same as the property but prefixed with the character $
<h4>Custom Getters and Setters</h4>
What happens when we want to provide custom behavior when reading or writing to properties? In these cases we can define getters and setters

<img src="{{ site.images }}/kj2-9.jpg" alt="201203102253.jpg" width="307" height="71" />

This is an example of a customer getter which always returns "Always Jack" as the value of the property <em>Name</em> irrelevant of what value it has. Notice how we just define it below the property. If our getter requires more than one line, we can use a { } block.
Much like the getter, we can also define a setter. In this setter, we can write any logic that interacts with other properties of the class. But what happens when we want to interact with the actual backing field of this property (the one that the compiler creates automatically)? as mentioned before, we can use the $ prefix to access it

<img src="{{ site.images }}/kj2-10.jpg" alt="201203102300.jpg" width="281" height="109" />

Setters can have different accessibility levels, by prefixing them with the corresponding keyword.
<h3>Functions</h3>
Although we won't dive too deeply into all the different aspects of functions in this part (otherwise it would be too long of a blog post), we will see the basics to create functions as part of our classes. A function declaration, in its simplest form is:

<img src="{{ site.images }}/kj2-11.jpg" alt="201203102307.jpg" width="288" height="82" />

consisting of the function <em>name,</em> optional <em>parameters,</em> optional <em>return type</em> and the <em>body.</em> Functions in Kotlin return tuples, that is they can return more than one value. When we do not specify a return type, we are implicitly saying that the return type is a <em>Unit</em> which is a tuple with 0 components.
Below is a full example of a class that takes two parameters in the constructor, initializes some properties and contains a function the prints out the full name.
<img src="{{ site.images }}/kj2-12.png" width="452" height="180" />

We'll dive deeper into functions and all the possibilities they offer in a different post.
<h3>Summary</h3>
In this second part, we've covered the basics of classes, how to declare one, how constructors work and how to define properties and functions. Classes in Kotlin however offer much more and there's a lot more to learn about them. In other parts we'll cover the difference between open and final classes (hint: default is final), abstract classes, inheritance, as well as traits, which are somewhat similar to interfaces in C#.
