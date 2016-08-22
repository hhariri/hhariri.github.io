---
layout: post
title: Git-Based Versioning
status: published
type: post
published: true
comments: true
---

In getting [Wasabi](https://github.com/wasabifx/wasabi) ready for it's first big 1.0,  [Micah Zoltu](https://github.com/Zoltu) suggested (and put in practice) that we switch to a new versioning model that ties versions to Git commits. 
Up to then we were merely using an auto-increment number on TeamCity. 

## Versioning based on commits

The idea is pretty simple - tag a specific commit and from that point forward, each commit will have its own version. The [README](https://github.com/Zoltu/Gradle.Plugin.Versioning) of the project explains it quite clearly

## Configuring the build script

One of the really nice things I like about this plugin is the zero configuration in Gradle. In fact the only thing necessary is to just add the plugin to the build script.

```groovy
plugin {
    id "com.zoltu.git-versioning" version "2.0.21"
}
```    

remove the *version* property from Gradle, and set a tag on a commit from where you want it to all start happening. 

<br/>
Now whenever you build, be it with a build server or from the command line, you'll have automatic versioning which will also be set in the JAR manifest.

## Passing information to TeamCity

The only issue with this approach is to pair up the version from Gradle. TeamCity currently has two configurations for Wasabi:


<br/>
![Build Configurations]({{ site.images }}/git-version-1.png)
<br/>
<br/>


The *Development* configuration builds on each check-in, and the *Publish* configuration is promoted manually to publish the corresponding artifacts to Bintray (and from there to jCenter and eventually Maven Central).
What is important is for all version numbers to pair up. In essence, what is needed is to somehow pass the version from Gradle to TeamCity. 

<br/>
Thankfully, with [TeamCity service messages](https://confluence.jetbrains.com/display/TCD10/Build+Script+Interaction+with+TeamCity), this is pretty straightforward. What we specifically need is to [report the build number](https://confluence.jetbrains.com/display/TCD10/Build+Script+Interaction+with+TeamCity#BuildScriptInteractionwithTeamCity-ReportingBuildNumber).
So in essence all that's needed is to add the following line to the Gradle build script


```groovy
println "##teamcity[buildNumber \'${version}\']"
```

which sends to the standard output a service message that TeamCity then captures. Only thing left is to configure TeamCity to use the right version number 
in builds

<br/>
![Build Number]({{ site.images }}/git-version-2.png)
<br/>
<br/>


With that, we now have automatic versioning from each commit all the way through. When it's time to release a new minor version or major, we simply set a new 
tag in the commit. 

<br/>
Btw, if you're doing .NET development, Micah has [similar functionality for .NET](https://github.com/Zoltu/Zoltu.Versioning) which is also available as a [NuGet Package](https://www.nuget.org/packages/Zoltu.Versioning/).









