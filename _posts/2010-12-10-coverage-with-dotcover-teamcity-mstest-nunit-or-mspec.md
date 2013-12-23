---
layout: post
title: Coverage with TeamCity and dotCover with MSTest, NUnit or MSpec
categories: []
tags:
- dotCover
- MSpec
- TeamCity
- Tools
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704325;}
  _elasticsearch_indexed_on: '2010-12-10 11:12:15'
  twitter_cards_summary_img_size: a:6:{i:0;i:646;i:1;i:133;i:2;i:3;i:3;s:24:"width="646"
    height="133"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}
---
As some of you know, we recently shipped <a href="http://www.jetbrains.com/teamcity">TeamCity</a> 6 which includes, out of the box, a bundled version of <a href="http://www.jetbrains.com/dotcover">dotCover</a>. What this means is that you can now get coverage reports for your code easily, and of course, for free if you’re using the Professional version of <a href="http://www.jetbrains.com/teamcity">TeamCity</a>.  The setup is quite easy if you are using MSTest and NUnit. For MSpec, you need to take a few additional steps.
<h3>Using MSTest / NUnit Runners</h3>
Normally build files consist of a series of tasks that involve compilation and running of tests. With TeamCity, you can separate some of these steps out into individual TeamCity Build steps, which is what we will be doing in this case (everything that we see here applies to both MSTest and NUnit).

Here is our build.xml (MSBuild) file:

<a href="http://hhariri.files.wordpress.com/2010/12/image.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb.png" border="0" alt="image" width="646" height="133" /></a>

As we can see, other than compiling a solution, which in this case consists of the actual application and the test assemblies, not much else going on.

[Note: this could have been done using the SLN as the Runner Type under TeamCity since this example build script does not do much else. In real scenarios however, build scripts do more than just call a solution (in fact normally you’d call projects not solutions)].

In TeamCity, we create a new build project and setup the VCS root. We then add a new Build Step which calls this MSBuild file:

<a href="http://hhariri.files.wordpress.com/2010/12/image1.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb1.png" border="0" alt="image" width="642" height="499" /></a>

Notice that all we are doing here is calling our MSBuild script. No coverage settings yet.

Next thing is to add an additional build step in TeamCity. This time, we are going to call MSTest as opposed to MSBuild:

<a href="http://hhariri.files.wordpress.com/2010/12/snaghtml1e386e79.png"><img style="display:inline;border-width:0;" title="SNAGHTML1e386e79" src="http://hhariri.files.wordpress.com/2010/12/snaghtml1e386e79_thumb.png" border="0" alt="SNAGHTML1e386e79" width="664" height="265" /></a>

<a href="http://hhariri.files.wordpress.com/2010/12/snaghtml1e3d642d.png"><img style="display:inline;border-width:0;" title="SNAGHTML1e3d642d" src="http://hhariri.files.wordpress.com/2010/12/snaghtml1e3d642d_thumb.png" border="0" alt="SNAGHTML1e3d642d" width="664" height="355" /></a>

(the sections cut out are blank).

In the <strong>.NET Coverage tool </strong>section we select JetBrains dotCover and then  add the assemblies we want coverage for (just the name of the assembly) prefixing them with <strong>+:</strong> and filtering out those we do not want coverage for with <strong>–:</strong>.

That’s all there is to it. Once we run the Build, we should now see a new tab with Coverage Reports as well as a new Artifact which contains the Coverage files zipped up.

<a href="http://hhariri.files.wordpress.com/2010/12/image2.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb2.png" border="0" alt="image" width="650" height="227" /></a>

The Code Coverage tab goes into more detail:

<a href="http://hhariri.files.wordpress.com/2010/12/image3.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb3.png" border="0" alt="image" width="664" height="219" /></a>

We can even drill down into individual classes and examine the code coverage:

<a href="http://hhariri.files.wordpress.com/2010/12/image4.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb4.png" border="0" alt="image" width="648" height="376" /></a>

If we are using NUnit instead of MSTest, the only difference is there test runner we select when adding a new Build Step in TeamCity. Instead of MSTest we choose NUnit along with the version:

<a href="http://hhariri.files.wordpress.com/2010/12/image5.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb5.png" border="0" alt="image" width="659" height="284" /></a>
<h3>What about MSpec or my Specific Test Runner?</h3>
If we are using MSpec or a different test runner that is not supported directly by TeamCity, we can still get coverage reports; we just need to do a little bit of additional configuration. TeamCity has an API which allows us to send it messages when we want to interact with it (this is actually quite a powerful feature but out of scope for this post so please leave a comment if you’d like me to cover it in more detail). We can leverage this API to tell it when to start coverage and where to get the results from.

Here is the build script for MSpec:

<a href="http://hhariri.files.wordpress.com/2010/12/image6.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb6.png" border="0" alt="image" width="664" height="240" /></a>

We have created two targets. The second one (TeamCity) is the one we are interested in. This does a couple of things:

1. The first <strong>&lt;Exec&gt; </strong>runs all MSpec tests so that we can see the test results inside TeamCity. This is not strictly necessary for Code Coverage but usually build processes do display these results. The --<strong>teamcity </strong>option we are passing in to MSpec is for it to generate the system messages that are then fed to TeamCity (see point 3)

2. The second <strong>&lt;Exec&gt; </strong>is the one that runs dotCover. This uses a configuration file called dotCover.xml which we will examine further down. We pass in the c (or coverage) option when calling dotCover.

3. This is a message we send to TeamCity to tell it that we have run coverage. We indicate the tool we are using (<strong>dotcover </strong>in this case) and where the results are located. TeamCity uses this information to then display the results in the UI. This is one of the API messages mentioned earlier.

Finally we need to define the dotcover.xml file with out configuration for running dotCover (for detailed information on creating <a href="http://www.jetbrains.com/dotcover">dotCover</a> configuration files, see <a href="https://hhariri.wordpress.com/2010/07/28/running-code-coverage-from-the-console-with-dotcover/">here</a> and <a href="https://hhariri.wordpress.com/2010/08/05/advanced-scenarios-with-dotcover-console-runner/">here</a>):

<a href="http://hhariri.files.wordpress.com/2010/12/image7.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb7.png" border="0" alt="image" width="673" height="581" /></a>

In terms of TeamCity, we then just define our build step that calls out to the build script:

<a href="http://hhariri.files.wordpress.com/2010/12/image8.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb8.png" border="0" alt="image" width="588" height="472" /></a>

Notice how we do not specify <strong>.NET Coverage </strong>options explicitly. And if all goes well, we can see the coverage output just as before:

<a href="http://hhariri.files.wordpress.com/2010/12/image9.png"><img style="display:inline;border-width:0;" title="image" src="http://hhariri.files.wordpress.com/2010/12/image_thumb9.png" border="0" alt="image" width="684" height="296" /></a>
<h3>Summary</h3>
We can see that running code coverage is now pretty straightforward when using MSTest, NUnit or even a custom test runner. Most of what we have covered for MSpec will work with pretty much any test runner in terms of coverage (feel free to vote <a href="http://youtrack.jetbrains.net/issue/TW-14864">here for MSpec support</a>).

With any build process, there are numerous ways of doing the same thing. I’m going to show you one of them. Based on your setup and needs you might want to do things differently. Fortunately TeamCity is flexible enough to allow for many scenarios.

One thing to be aware of is that dotCover creates some temporary files for the XmlSerailizer in the Temp profile folder. This normally is not a problem unless the folder does not exist. If you are running TeamCity under the SYSTEM account, make sure that the folder C:\Windows\system32\config\systemprofile\AppData\Local\<strong>Temp </strong>exists. This will probably change in future versions so to avoid any possible issues.

Enjoy!
