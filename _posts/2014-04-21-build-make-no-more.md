---
layout: post
title: Build Tools - Make, no more
status: published
type: post
published: true
comments: true
---

Had to update some CSS on my site over the weekend, which led me to updating some LESS file. The template I use for the site
uses Grunt, which forced me to download the entire Internet via npm. And all I wanted to do was set a *text-indent* to 0.
<br/><br/>
If you've never seen Grunt, here's what it looks like:

{% highlight javascript %}

module.exports = function(grunt) {

    grunt.initConfig({
        jshint: {
            options: {
                jshintrc: '.jshintrc'
            },
        all: [
            'Gruntfile.js',
            'asselts/js/*.js'
        ]
    }

    ...

{% endhighlight %}

I find it's very appropriately named, like the ugly little creatures in Halo.
<br/>
Of course, you don't have to use Grunt. In fact, [Grunt is already dead](http://www.100percentjs.com/just-like-grunt-gulp-browserify-now/). It's all about Gulp nowadays:

{% highlight javascript %}

var gulp = require('gulp');

var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var imagemin = require('gulp-imagemin');

var paths = {
  scripts: ['client/js/**/*.coffee', '!client/external/**/*.coffee'],
  images: 'client/img/**/*'
};

gulp.task('scripts', function() {
  // Minify and copy all JavaScript (except vendor scripts)
  return gulp.src(paths.scripts)
    .pipe(coffee())
    .pipe(uglify())
    .pipe(concat('all.min.js'))
    .pipe(gulp.dest('build/js'));
});

...

{% endhighlight %}

<br/>
But if you don't like JavaScript, you could probably go with Rake, which is Ruby:

{% highlight ruby %}

task :default => [:test]

task :test do
  ruby "test/unittest.rb"
end

{% endhighlight %}

<br/>
If you like Ruby but don't want to install it, and you're on Windows, just use PSake

{% highlight powershell %}

properties {
  $testMessage = 'Executed Test!'
  $compileMessage = 'Executed Compile!'
  $cleanMessage = 'Executed Clean!'
}

task default -depends Test

task Test -depends Compile, Clean {
  $testMessage
}

task Compile -depends Clean {
  $compileMessage
}

task Clean {
  $cleanMessage
}

task ? -Description "Helper to display task info" {
	Write-Documentation
}

{% endhighlight %}

<br/>
If you don't like Ruby, install Java and use Gradle. It's Groovy and has [65 chapters of documentation](http://www.gradle.org/docs/current/userguide/userguide.html) as well as
a few appendixes in case you run out of things to read.

{% highlight groovy %}

buildscript {
    project.ext.kotlinVersion = "0.7.270"

    version = "0.1-SNAPSHOT"

    repositories {
        mavenCentral()
        maven {
            url 'http://oss.sonatype.org/content/repositories/snapshots'
        }
    }
    dependencies {
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$ext.kotlinVersion"
    }
}

apply plugin: 'kotlin'
apply plugin: 'maven'
apply plugin: 'maven-publish'

repositories {
    mavenLocal()
    mavenCentral()
    maven {
        url 'http://oss.sonatype.org/content/repositories/snapshots'
    }
}

{% endhighlight %}

<br/>
And if you do like Rake but don't like Ruby, but do like JavaScript, try [Jake](http://www.cappuccino-project.org/blog/2010/04/introducing-jake-a-build-tool-for-javascript.html)
<br/>
Finally, if you really have nothing better to do, pick one of your favourite XML-based build tools such as Ant, NAnt or MSBuild

{% highlight xml %}

<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Compile Include="helloworld.cs" />
  </ItemGroup>
  <Target Name="Build">
    <Csc Sources="@(Compile)"/>
  </Target>
</Project>

{% endhighlight %}

Of course, you could have just used Make to begin with

{% highlight make %}
all: hello

hello: main.o factorial.o hello.o
	g++ main.o factorial.o hello.o -o hello

main.o: main.cpp
	g++ -c main.cpp

factorial.o: factorial.cpp
	g++ -c factorial.cpp

hello.o: hello.cpp
	g++ -c hello.cpp

clean:
	rm -rf *o hello

{% endhighlight %}

## DSL's over Make

If you look at all the examples above, they are nothing but DSL's over Make in your language of choice. In some cases not even that, but just some syntactic sugar.
They still focus on the same core concepts:

- Primitives
- Targets
- Tasks

and still force us to transcribe the complexity of a build system in written form.
<br/>
<br/>

And with each new Build tool, all we do is just add yet another grammar to learn, another series of tools and plugins
to download, configure and install. And for what? Just to have a bit of a nicer syntax? Without for a moment thinking
of the legacy that we leave behind with all these new 'inventions'? Of course, some languages and platforms might need technology-specific tasks, but is a new build tool and syntax all that necessary?
<br/>
<br/>
I think Gradle's tagline is somewhat approriate to describe all these different build tools: 'Automation Evolved'. Yes, we've involved
because we've moved from tabs and lines, to XML and then to, well, hmm, tabs, lines and curly braces.

## Make, no more.

If you're setting out to make another build tool, think about what benefit you're going to provide over the existing ones. Adding yet another
custome DSL and grammar isn't going to really solve any problem.

I feel there is innovation possible in build automation. We have a vast amount of existing knowldge on how software is built and the needs required,
we have seen the benefits of using convention over configuration, we have created powerful analysis tools. Combining these things I feel there is potential
to create a build tool that focuses more on discoverability than it does, about us, as developers, having to explicitly declare what we want done.
<br/><br/>
So please, no more Makes.
