---
layout: post
title: 'The Kotlin Journey Part IV: Adding functionality'
categories:
- JetBrains
tags:
- Kotlin
status: publish
type: post
published: true
meta:
  draftfeedback_requests: a:1:{s:13:"506440d4747af";a:3:{s:3:"key";s:13:"506440d4747af";s:4:"time";s:10:"1348747476";s:7:"user_id";s:7:"5078411";}}
  _elasticsearch_indexed_on: '2012-09-27 11:45:27'
  twitter_cards_summary_img_size: a:6:{i:0;i:410;i:1;i:124;i:2;i:3;i:3;s:24:"width="410"
    height="124"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
comments: true
---
This is a multi-part series on Kotlin, a new statically typed language from JetBrains targeting the JVM and JavaScript

<a href="http://hadihariri.com/2012/02/17/the-kotlin-journey-part-i-getting-things-set-up/">Part I: Getting things set up</a>
<a href="http://hadihariri.com/2012/03/10/the-kotlin-journey-part-ii-a-premier-on-classes/">Part II: A primer on classes</a>
<a href="http://hadihariri.com/2012/07/21/the-kotlin-journeypart-iii-wrapping-up-classes/">Part III: Wrapping up classes</a>
<a href="http://hadihariri.com/2012/09/27/the-kotlin-journey-part-iv-adding-functionality" target="_blank">Part IV: Adding functionality</a>
<h3>All the goodies you'd expect</h3>
Up to now we've seen how to work with classes and only slightly touched on the subject of functions in Kotlin, reason being that functions deserve their own section, as they play a very important role in Kotlin and expose a lot of the potential the language offers. Let’s dive in a bit more now.

Functions in Kotlin are declared using the keyword <em>fun</em>. By default, if we do not specify a return type, <em>Unit </em>is returned which would be the equivalent of <em>void, </em>although we do not need to explicitly indicate it. Parameters, much like constructors of classes that we’ve already seen, follow the Pascal convention of name colon type.

If you're coming from a C# background, expect pretty much everything you have in C#, including:

<strong>Optional parameters</strong>

<a href="{{ site.images }}/1237-1.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-5.png" alt="image" width="410" height="124" border="0" /></a>

The last parameter being passed in to the <em>logMessage </em>function is optional (like C# they always need to be at the end). If nothing is supplied, a default value is used. In this case, it’s using the current date time by instantiating an instance of Date.

<strong>Named parameters</strong>

We can also call functions using names to reference parameters, making the order of which we pass arguments in irrelevant

<a href="{{ site.images }}/kj4-2.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-2.png" alt="image" width="414" height="90" border="0" /></a>

<strong>Variable number of parameters</strong>

If we want to pass in a random number of arguments, we can prefix a parameter with the keyword <em>vararg </em>which by default creates an array of the type of the parameter

<a href="{{ site.images }}/kj4-3.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-3.png" alt="image" width="250" height="164" border="0" /></a>

As such the example above would be an array of Integers.

<strong>Statics in Kotlin</strong>

The concept of static methods doesn’t really exist in Kotlin as functions can be declared as top-level. As such, we can define a series of functions in a module and then have access to all of them by merely referencing the module. Therefore there’s no real need for statics. We can also declare one function local to another, much like in Pascal.

<strong>Reducing amount of code with single-line functions</strong>

If a function consists of single line of code, whether or not it returns a value, we can omit curly braces and reduce a little bit the number of characters. For instance, the previous <em>logMessage </em>could be written out as:

<a href="{{ site.images }}/kj4-4.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-4.png" alt="image" width="445" height="40" border="0" /></a>

The compiler can infer the return type, so even if we were to return a value, we wouldn’t need to explicitly declare it.
<h3>enabling fluent code</h3>
Kotlin allows us to reduce some of the noise that is usually associated with certain programming languages, by offering a series of features that enable us to write code that is somewhat a bit more fluent, or closer to natural languages.

To begin with, any function that takes two parameters can be called in infix notation. This means that we can do things such as:

<a href="{{ site.images }}/kj4-5.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-5.png" alt="image" width="380" height="124" border="0" /></a>

where <em>plus </em>and <em>equals </em>are functions that take two arguments (and defined as single-line for brevity):

<a href="{{ site.images }}/kj4-6.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-6.png" alt="image" width="270" height="57" border="0" /></a>

<a href="http://kotlin.jetbrains.org" target="_blank">Kotlin</a> also allows extensions functions, thus allowing us to extend a class with functionality without having to inherit from it. If you’re a C# programmer, you’re familiar with extension methods. Only difference is that in Kotlin, the declaration is more succinct:

<a href="{{ site.images }}/kj4-7.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-7.png" alt="image" width="167" height="59" border="0" /></a>

This adds a new function to the String class called <em>console </em>(takes no parameters). Inside the function, we can refer to the object itself using the keyword <em>this</em>. Notice how as opposed to C#, we do not have to create a static class, a static function, or pass <em>this </em>as the first parameter.

And of course, extension functions can also be called using infix notation. By defining the extension <em>then </em>to be:

<a href="{{ site.images }}/kj4-8.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-8.png" alt="image" width="236" height="82" border="0" /></a>

we can write code like this:

<a href="{{ site.images }}/kj4-9.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-9.png" alt="image" width="269" height="31" border="0" /></a>

not that I’m saying we should write the code above, but you get the point. It opens up many possibilities.
<h2>Adding function literals and high-order functions to the mix</h2>
Functions in Kotlin can take other functions as parameters. Combined with function literals (or lambda expressions), it allows us to write the following:

<a href="{{ site.images }}/kj4-10.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-10.png" alt="image" width="361" height="165" border="0" /></a>

Here we have a function <em>callFunctions</em> that takes as parameter a function that takes itself two parameters (of type Int) and returns an Int. We then call this function in two different ways: passing in as parameter a function previously declared (<em>sumNumbers</em>) or passing in a function literal.

Last but not least, we can even define extension functions using function literals:

<a href="{{ site.images }}/kj4-11.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" src="{{ site.images }}/kj4-11.png" alt="image" width="385" height="68" border="0" /></a>

Combining all of these things, we can then start <a href="http://confluence.jetbrains.net/display/Kotlin/Type-safe+Groovy-style+builders" target="_blank">building nice, fluent and statically typed DSL’s</a>
<h3>Summary</h3>
We’ve seen a brief overview of some of the functionality Kotlin provides with functions (pun not intended). There are quite a few other important features such as the ability to override operators using conventions (i.e. to override +=, define a function called <em>plusAssign</em>), as well as some the ability to drop braces when functions only have one arguments, inline functions, local functions etc. For more information about these and other features, <a href="http://confluence.jetbrains.net/display/Kotlin/Functions" target="_blank">check out the function section</a> on the documentation page.
