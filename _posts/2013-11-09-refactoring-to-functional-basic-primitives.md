---
layout: post
title: Refactoring to Functional– Basic Primitives
categories:
- General
- JetBrains
tags:
- Functional Programming
- Kotlin
status: publish
type: post
published: true
meta:
  _publicize_pending: '1'
  _elasticsearch_indexed_on: '2013-11-09 09:20:01'
---
This is a multi-part series on Refactoring to Functional Programming
<ol>
	<li><a href="https://hadihariri.com/2013/10/14/refactoring-to-functional-getting-started/">Getting Started</a></li>
	<li>Basic Primitives</li>
	<li><a href="http://hadihariri.com/2013/11/18/refactoring-to-functional-reducing-and-flattening-lists/">Reducing and Flattening Lists</a></li>
	<li><a href="http://hadihariri.com/2013/11/24/refactoring-to-functionalwhy-class/">Why Class?</a></li>
</ol>
Say we have a list of great albums (i.e. Pink Floyd’s discography*)

{% highlight kotlin %}
data class Album(val title: String, val year: Int, val chartUK: Int, val chartUS: Int)

val albums = listOf(
        Album("The Dark Side of the Moon", 1973, 2, 1),
        Album("The Wall", 1979, 3, 1),
        Album("Wish You Were Here", 1975, 1, 1),
        Album("Animals", 1977, 2, 3),
        Album("The Piper at the Gates of Dawn", 1967, 6, 131),
        Album("The Final Cut", 1983, 1, 6),
        Album("Meddle", 1971, 3, 70),
        Album("Atom Heart Mother", 1970, 1, 55),
        Album("Ummagumma", 1969, 5, 74),
        Album("A Sauceful of Secrets", 1968, 9, 0),
        Album("More", 1969, 9, 153))
{% endhighlight %}

We want to get a list of all albums that were number one in both the US and the UK.
<h3>The Imperative Approach</h3>
Let’s go for the simple approach. A for loop iterating the length of the list and adding the new items to another list.

{% highlight kotlin %}
fun topUSandUK_v1(albums: List<Album>): List<Album> {

    val hits = arrayListOf<Album>()
    for (i: Int in 0..albums.count()-1) {
        if (albums[i].chartUK == 1 && albums[i].chartUS == 1) {
            hits.add(albums[i])
        }
    }
    return hits;
}
{% endhighlight %}

This works and is simple enough. But there are a couple of issues, if we’re trying to abide by the functional paradigms highlighted in the <a href="https://hhariri.wordpress.com/?p=3063">previous post</a>. In particular, treating things as infinite. Here we’re consciously aware of the length of the list.
<h3>Refactoring to infinite lists</h3>
We want to avoid having to deal with indices, lengths and counts and worrying whether we have some element in or out of bounds. So the first step is to refactor to remove the actual loop index. In Kotlin, there is a <em>for in </em>loop which allows us to iterate through anything that has an <em>iterator()</em> function. In other words, anything that implements <em>Iterable&lt;T&gt;</em>.

{% highlight kotlin %}
fun topUSandUK_v2(albums: List<Album>): List<Album> {

    val hits = arrayListOf<Album>()
    for (album in albums) {
        if (album.chartUK == 1 && album.chartUS == 1) {
            hits.add(album)
        }
    }
    return hits;
}
{% endhighlight %}

Now we no longer need to deal with lengths.
<h3>Adding some syntactic sugar</h3>
The previous is better, but we can add some syntactic sugar. Instead of explicitly having a <em>for in</em> we can use an extension function that Kotlin provides, <em>forEach </em>which does the same thing

{% highlight kotlin %}
fun topUSandUK_v3(albums: List<Album>): List<Album> {

    val hits = arrayListOf<Album>()
    albums.forEach {
        if (it.chartUK == 1 && it.chartUS == 1) {
            hits.add(it)
        }
    }
    return hits;
}
{% endhighlight %}

Since we no longer have the actual <em>album </em>element we can reference the current item the iterator is on using the <em>it </em>reserved word in Kotlin.
<h2>What we want instead of how we want it</h2>
If we look at the previous code, what we’re doing is removing elements that don’t match a certain criteria. We’re doing this by creating another list and adding the ones that do match to this new list. But if we were to remove the name of the function, to understand what we’ve just described, we’d need to mentally envision it taking into account the for loop, the temporary list, etc.

Of course, with this code it isn’t that hard but add another embedded for loop and things can start to get ugly.

The problem here is that we’re telling the computer how we want something done, instead of what we want done. What we want is to filter a list. What we’ve done is create another list and copy items to it, then return that list. Why not instead just filter the list?
<h3>Refactoring to <em>asking </em>versus <em>telling</em></h3>
In Kotlin there is a <em>filter </em>function that takes a list and returns a new one that matches a certain predicate.

{% highlight kotlin %}
fun <T> Collection<T>.filter(predicate: (T) -> Boolean) : List<T>
{% endhighlight %}

We can therefore refactor the code to

{% highlight kotlin %}
fun topUSandUK_v4(albums: List<Album>): List<Album> {
    return albums.filter {
        (it.chartUK == 1 && it.chartUS == 1)
    }
}
{% endhighlight %}

The reason we’re omitting the parenthesis is that by convention in Kotlin, if the last parameter to a function is another function, we can omit these.

As a side-effect of this refactoring, we’ve also removed the temporary list, and while in the previous code, <em>hits </em>was declared as immutable, the list itself (declared as ArrayList) was mutable. Win?
<h2>Changing data types</h2>
What happens now if we need something slightly different? We’re not always bound to work with the same type of data. Let’s assume for instance we want to return the years where an album made it to number one in both the UK and the US. We could of course do the following

{% highlight kotlin %}
fun topUSandUK_hits_years_v1(albums: List<Album>): List<Int> {
    val hits = albums.filter {
        (it.chartUK == 1 && it.chartUS == 1)
    }
    val years = ArrayList<Int>()
    hits.forEach {
        years.add(it.year)
    }
    return years;
}
{% endhighlight %}

The problem is that we re-introduce again some of the issues we had previous, namely using a temporary variable and again telling the computer how we want something versus what we want.
<h3>Using Map to transform results</h3>
Much like <em>filter</em>, Kotlin offers another function to help us do this: <em>map</em>.

{% highlight kotlin %}
fun <T, R> Collection<T>.map(transform : (T) -> R) : List<R>
{% endhighlight %}

which takes a function that given an input of type T produces an output of type R, returning a list of R. We can therefore refactor the previous code to

{% highlight kotlin %}
fun topUSandUK_hits_years_v2(albums: List<Album>): List<Int> {
    return albums.filter {
        (it.chartUK == 1 && it.chartUS == 1)
    }.map {
        it.year
    }
}
{% endhighlight %}

Once again we’ve gone from saying how to do something to asking for it.
<h2>Basic Primitives</h2>
The two functions we’ve just used: <em>map </em>and <em>filter </em>are some of the main primitives in functional programming. With them we can start to treat lists as infinite, chain them and transform results to what we need without having to deal with for loops, lengths, indices or complicated loops. We’ll see if they actually do help dramatically as we start working on more complex scenarios.

Until next time.

*The true Pink Floyd.
