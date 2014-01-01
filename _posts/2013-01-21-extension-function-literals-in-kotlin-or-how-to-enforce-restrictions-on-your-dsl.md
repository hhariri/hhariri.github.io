---
layout: post
title: Extension Function Literals in Kotlin or How to enforce restrictions in your
  DSL
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
  draftfeedback_requests: a:1:{s:13:"50fd6ae5cc0ad";a:3:{s:3:"key";s:13:"50fd6ae5cc0ad";s:4:"time";s:10:"1358785253";s:7:"user_id";s:7:"5078411";}}
  _publicize_pending: '1'
  _elasticsearch_indexed_on: '2013-01-21 18:35:17'
comments: true
---
Take a look at the following code, an example of a specification written using <a href="http://github.com/hhariri/spek">spek</a>

{% highlight kotlin %}
given("a calculator", {

  val calculator = Calculator()

  on("calling sum with two numbers", {

    val sum = calculator.sum(2, 3)

    it("should return the sum of the two numbers", {

      shouldEqual(5, sum)
    }
  }
}
{% endhighlight %}

In this code, <em>given</em>, <em>on</em> and <em>it</em> are all functions.

Kotlin allows top-level functions to be defined (without the need for them to belong to a class). As such, we could merely declare these functions in a single file as below:

{% highlight kotlin %}
public fun given(description : String, givenExpression: () -> Unit) {

    // code omitted
}

public fun on(description: String, onExpression: () -> Unit) {

    // code omitted
}

public fun it(description: String, itExpression: () -> Unit)  {

   // code omitted
}
{% endhighlight %}

At first sight it might not seem like a bad approach, but it is. The problem is that you cannot prevent someone from calling the code like so:

{% highlight kotlin %}
 given("I have nothing", {
        it("should do nothing", {
            on("not doing anything", {

            })
        })
    })
{% endhighlight %}

or even:

{% highlight kotlin %}
it("should do nothing", {
        given("I have nothing", {
            on("not doing anything", {

            })
        })
})
{% endhighlight %}

or any other weird combination for that matter.

This means that we would now have to put in additional runtime checks to verify that things are called in the correct manner; context has been set up before the action, the action has been executed before the assertions and so on and so forth. Pain.
<h3>Extension Function Literals</h3>
We've <a href="http://hadihariri.com/2012/09/27/the-kotlin-journey-part-iv-adding-functionality/">already seen</a> that Kotin has extension functions, similar to C#. We've also seen that we can define extension functions as function literals:

{% highlight kotlin %}
var spaceReplace = { String.(char: Char): String -> this.replace(' ', char) }

val output = "This is an example".spaceReplace('_')

// outputs: This_is_an_example
{% endhighlight %}

Combining this with high-order functions, that is a function that takes a function as a parameter, we can do:

{% highlight kotlin %}
public fun given(description : String, givenExpression: Given.() -> Unit) {
  // code omitted
}

public class Given {
    public fun on(description: String, onExpression: On.() -> Unit) {
        // code omitted
    }
}

public class On {
    public fun it(description: String, itExpression: It.()->Unit) {
      // code omitted
    }
}

public class It {

    fun shouldEqual<T>(expected: T, actual: T) {
        assertEquals(expected, actual)
    }

    // rest of code omitted...
}
{% endhighlight %}

<em>given </em>is still a top-level function. However, the diference is that <em>on</em> and <em>it</em> are no longer top-level. Instead, we're creating three different classes: <em>Given</em>, <em>On</em> and <em>It</em>.

Let's take a look at the <em>Given </em>class. This class has a method that takes two parameters: a string, which is the description and a second parameter which is the extension function literal we've been talking about:

{% highlight kotlin %}
public class Given {
    public fun on(description: String, onExpression: On.() -> Unit) {
        // code omitted
    }
}

{% endhighlight %}

The parameter is an extension function on the <i>On </i>class, which takes no parameters and returns no value (<em>Unit</em> in Kotlin - void).

We repeat the same pattern with the <em>On </em>and <em>It </em>classes. By doing this, we now enforce a certain flow at compile time and prohibit out of order usage.

You can see also in the code, that the <em>It</em> class contains a series of assertion methods, exactly where they belong.
<h3>Summary</h3>
We can see that with some simple extension function literals, we can easily impose a series of restrictions on our DSL's. Of course, in this case, the example is quite straightforward but the same thing can be applied to designing other DSL's such as HTML builders et al.

[Thanks to <a href="http://twitter.com/orangy">@orangy</a> for highlighting the issue and refactoring of Spek to this]
