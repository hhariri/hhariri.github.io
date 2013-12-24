---
layout: post
title: 'ReSharper on the Server: Detecting Code Issues in the build'
categories:
- JetBrains
tags:
- Code Qualty
- Inspections
- TeamCity
status: publish
type: post
published: true
meta:
  _publicize_pending: '1'
  _elasticsearch_indexed_on: '2012-10-10 10:22:10'
  twitter_cards_summary_img_size: a:6:{i:0;i:669;i:1;i:702;i:2;i:3;i:3;s:24:"width="669"
    height="702"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
---
Did you know that you can run <a href="http://www.jetbrains.com/resharper">ReSharper</a> Code Inspections on the server using <a href="http://www.jetbrains.com/teamcity">TeamCity</a>? In fact, we added support for this functionality in <a href="http://blogs.jetbrains.com/teamcity/2011/10/13/now-we-see-dead-code-too/">TeamCity just over a year ago</a> but it seems that the feature is not widely known, specially by ReSharper users.

The setup itself is extremely simple, and we’re going to walk through it, and additionally add some more goodies in the mix.
<h3>Activating .NET Inspections in TeamCity</h3>
Adding ReSharper inspections to the build process is merely adding the Build Step named <strong>Inspections (.NET)</strong><em>.</em> The only parameter required is the Visual Studio Solution file

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image-23-1.png" alt="image" width="669" height="702" />

If we do not specify a <strong>Custom settings profile path</strong>, TeamCity takes the default ReSharper settings for code inspections. However, we can configure these to match our own/teams criteria. This is done via <strong>Options | Inspection Severity</strong>. We can change a specific setting severity, for instance, that of using <em>String.IsNullOrEmpty </em>

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image-23-2.png" alt="image" width="507" height="174" />

and save the settings to the Team Shared file. This then saves the settings in a file named <em>{Solution}.sln.DotSettings</em> which is normally checked in to source control so that it automatically applies to other team members when the solution is opened in Visual Studio. We can use this same settings file to indicate custom inspection settings for TeamCity

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image-23-3.png" alt="image" width="629" height="104" />
<h3>Analyzing results</h3>
When the build step runs, TeamCity generates a navigable report for us to analyze inspection results

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image-23-4.png" alt="image" width="695" height="633" />

We can navigate through the inspections for the entire project or a specific namespace. Inspections are grouped by Category, Issue Type and the corresponding files on the right pane. We can even navigate to the actual file by clicking on the line number. For this though, we need to have Visual Studio and the TeamCity plugin for Visual Studio installed (if you do not, clicking on the link will prompt you with a dialog box to download and install the plugin).

<em>The checkbox <strong>Inspections with new problems only </strong>is used to highlight only new issues since the last build run. The numbers in bracket (+1 –1) are the variance since the last run. </em>
<h3>Taking action based on inspection severity</h3>
One of the main benefits of adding inspections on the server-side is to put some level of code quality in place, whereby we can have the build process take action based on a series of conditions. For instance, we might like to have a build fail if too many warnings or errors are detected.

Under <strong>Build Failure Conditions </strong>in the Project Configuration window, we can add a new Build failure condition:

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image-23-5.png" alt="image" width="444" height="293" />

We select <em>Fail build on metric change </em>and then indicate whether we want a build to fail based on warnings or errors. In our case we’re going to select errors and have it fail if it is more than one.

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image-23-6.png" alt="image" width="612" height="260" />

It should be apparent that if we want inspections to have an impact on the status of our build, that is, have a build fail, we can only do so based on Warnings or Errors. Therefore, Hints and Suggestions cannot be used. As such, when configuring inspections severity in ReSharper, we should take this into account.

If we now run our build again, it should fail as the number of errors are greater than one. Below is the output of the same input and inspections, but one run with the Build failure condition and the other without it.

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image-23-7.png" alt="image" width="649" height="54" />
<h3>Checking for copy/paste code</h3>
Although strictly speaking, this isn’t related to ReSharper, but since we’re talking about code quality in the build process, it makes sense to also mention that TeamCity can check for code duplication.

Much like before, activating code duplication is simply a matter of adding a new build step, namely <strong>Duplicates finder (.NET)<em>.</em> </strong>We can indicate the folders to ignore, whether we want to take into account namespaces, type names, as well as a few other options.

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image71.png" alt="image" width="716" height="702" />

The output is a nicely formatted navigable screen which allows us to go through the different files and see a side-by-side comparison of what TeamCity has detected as duplication (resized below for space limitations)

<img style="margin:10px 0 0;display:inline;" title="image" src="{{ site.images }}/image81.png" alt="image" width="968" height="524" />

And as expected, we can also fail the build if we have too many code duplicates

<img style="margin:10px auto 0;display:block;float:none;" title="image" src="{{ site.images }}/image91.png" alt="image" width="613" height="261" />
<h3>Summary</h3>
It is refreshingly simple to add code quality detection features to the build process and have a build fail if something that shouldn’t be in production code slips through. The next step would be to provide Custom Patterns, which currently are not supported. If you feel this is a feature you’d like, <a href="http://youtrack.jetbrains.com/issue/TW-23996">let us know</a>, and as always, any and all feedback is welcome.
