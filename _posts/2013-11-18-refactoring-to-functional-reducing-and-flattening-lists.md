---
layout: post
title: Refactoring to Functional– Reducing and Flattening Lists
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
  _elasticsearch_indexed_on: '2013-11-18 07:04:54'
---
This is a multi-part series on Refactoring to Functional Programming
<ol>
	<li><a href="https://hadihariri.com/2013/10/14/refactoring-to-functional-getting-started/">Getting Started</a></li>
	<li><a href="https://hadihariri.com/2013/11/09/refactoring-to-functional-basic-primitives">Basic Primitives</a></li>
	<li>Reducing and Flattening Lists</li>
	<li><a href="http://hadihariri.com/2013/11/24/refactoring-to-functionalwhy-class/">Why Class?</a></li>
</ol>
In this part let’s pick up some more primitives of functional programming and see how we can use them. We’re going to expand the previous list of albums to also include track information

```kotlin
data class Track(val title: String, val durationInSeconds: Int)

val pinkFloyd = listOf(
        Album("The Dark Side of the Moon", 1973, 2, 1,
                listOf(Track("Speak to Me", 90),
                        Track("Breathe", 163),
                        Track("On he Run", 216),
                        Track("Time", 421),
                        Track("The Great Gig in the Sky", 276),
                        Track("Money", 382),
                        Track("Us and Them", 462),
                        Track("Any Color You Like", 205),
                        Track("Brain Damage", 228),
                        Track("Eclipse", 123)
                )
        ))
        // the rest omitted for brevity
```

We’re going to solve two different exercises this time:
<ol>
	<li>Get a list of albums and their total duration.</li>
	<li>Get a list of tracks that are shorter than a certain length, along with the corresponding album title.</li>
</ol>

To get a list of albums and their total duration, we’ll go for the simplest approach, using some of the primitives we picked up in the previous part.

{% highlight kotlin %}
fun nameAndTotalTime_v1(albums: List<Album>): List<Pair<String, Int>> {
    return albums.map {
        var total = 0
        it.tracks.forEach {
            total += it.durationInSeconds
        }
        Pair(it.title,total)
    }
}
{% endhighlight %}

<h3><i>reducing</i> to a single value</h3>
What we’re doing in the previous code is iterating through the list of tracks and summing them up. As expected, there’s a function for that: <em>reduce. </em>Reduce takes a list of items and returns a single value, applying a specific operation to the list.


{% highlight kotlin %}
fun sumOfInts(list: List<Int>): Int {
    return list.reduce { (x, y) -> x + y}
}
{% endhighlight %}

Knowing this, we can refactor the code to use <em>reduce</em>.

{% highlight kotlin %}
fun nameAndTotalTime_v2(albums: List<Album>): List<Pair<String, Int>> {
    return albums.map {
        Pair(it.title, it.tracks.map { it.durationInSeconds }.reduce { x, y -> x +y })
    }
}
{% endhighlight %}

<h3><em>reduce </em>versus <em>fold</em></h3>
Kotlin also provides a very commonly used function named <em>fold </em>which does the same thing as <em>reduce</em>. The difference between the two is that <em>fold </em>takes an explicit initial value, whereas <em>reduce  </em>uses the first element from the list as the initial value.
<h2>Dealing with trees</h2>
Up to now, we’ve used <em>forEach</em>, <em>map</em>, <em>filter</em> and <em>reduce</em> to perform operations on lists. The problem with trying to find a list of tracks that meet a certain criteria is that this list is a list inside another list, i.e. we have a tree, albeit a small one. Filtering the original list is not going to work since the information to filter is on a branch. We therefore need to filter out based on the branch.

Here’s a first attempt

{% highlight kotlin %}
fun albumAndTrackLowerThanGivenSeconds_v1(durationInSeconds: Int, albums: List<Album>): List<Pair<String, String>> {

    val list = arrayListOf<Pair<String, String>>()
    albums.forEach {
        val album = it.title
        it.tracks.filter {
            it.durationInSeconds <= durationInSeconds
        }.map {
            list.add(Pair(album, it.title))
        }
    }
    return list
}
{% endhighlight %}

What we're doing is iterating through the list of albums, and then for each one, filtering out those that match a certain criteria. On each iteration we hold a reference using a closure to the current album, and then add those matching the criteria as a new pair to the result.

Once again we can avoid some of this <i>manual </i>work and delegate it to a function named <em>flatMap </em>that takes a list, applies a transformation to each item and returns a new list with these items.


{% highlight kotlin %}
fun <T, R> Iterable<T>.flatMap(transform: (T)-> Iterable<R>) : List<R>
{% endhighlight %}

With that, we can refactor the previous code to

{% highlight kotlin %}
fun albumAndTrackLowerThanGivenSeconds_v2(durationInSeconds: Int, albums: List<Album>): List<Pair<String, String>> {
    return albums.flatMap {
        val album = it.title
        it.tracks.filter {
            it.durationInSeconds <= durationInSeconds
        }.map {
            Pair(album, it.title)
        }
    }
}
{% endhighlight %}

There’s a more generic version of <em>flatMap</em>, named <em>flatMapTo</em> which allows us to specify the resulting collection.

{% highlight kotlin %}
fun <T, R, C: MutableCollection<in R>> Iterable<T>.flatMapTo(result: C, transform: (T) -> Iterable<R>) : C
{% endhighlight %}

<h2>Other constructs as they come</h2>
In addition to filtering results, we can also find out if an item on the list matches a certain predicate with <em>any</em>, or if all items match it with <em>all</em> and last but not least find the first item that matches it with <em>find</em>.

We can also group items of a list or zip two lists (combine items from each list into pairs into a new list) as well as perform a few more basic operations on lists. Hopefully with these constructs we'll have enough to solve problems.

Until next time.
