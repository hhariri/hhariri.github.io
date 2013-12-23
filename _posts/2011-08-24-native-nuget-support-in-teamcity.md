---
layout: post
title: Native NuGet Support in TeamCity
categories:
- JetBrains
tags:
- NuGet
- TeamCity
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704302;}
  _elasticsearch_indexed_on: '2011-08-24 19:34:45'
---
A few months ago, <a href="http://twitter.com/shanselman">Scott Hanselman</a> gave a session at TechEd US were he showed some new features we were working on for TeamCity, in order to provide first class support for NuGet. He later <a href="http://www.hanselman.com/blog/NuGetForTheEnterpriseNuGetInAContinuousIntegrationAutomatedBuildSystem.aspx">blogged about it here</a>. 

Instead of delaying until the next release of TeamCity, this feature (like many), has been developed as a plug-in. <a href="http://twitter.com/jonnyzzz">Eugene</a>, who has been working on it, announced the availability of a first build a few weeks ago. After some initial trials and changes, I decided to setup <a href="http://github.com/JetBrains/YouTrackSharp">YouTrackSharp</a> to automate the publishing of the NuGet package. It was surprisingly easy as you'll see.

<h3>1. Installing the Plug-in
</h3>
If your project is running on <a href="http://teamcity.codebetter.com">TeamCity at Codebetter.com</a>, you can skip to Step 3, since it's already installed and configured. If not, then grab the <a href="http://teamcity.jetbrains.com/viewType.html?buildTypeId=bt324&amp;tab=buildTypeStatusDiv">latest build from our public TeamCity server</a>. Place the zip file into the plugins folder of your TeamCity installation and restart the server.

<h3>2. Configuring the NuGet version</h3>
Once the server is running, and agents updated (automated procedure), you then need to tell TeamCity what NuGet version you want to use. The plug-in knows about the nuget.org feed to it can grab the latest version of the command line tool directly. Click on Administration | Server Configuration. If the plug-in installed correctly, you should now have a new Tab called NuGet:

<img src="http://hhariri.files.wordpress.com/2011/08/adminpanelnuget.png" alt="AdminPanelNuGet" title="AdminPanelNuGet.png" border="0" width="600" height="191" />

Click on the "Install additional versions of the NuGet.exe Command Line". TeamCity will read from the feed and display available versions to you in the dialog box. Select the version you want and click Install:

<img src="http://hhariri.files.wordpress.com/2011/08/nugetversion.png" alt="NuGetVersion" title="NuGetVersion.png" border="0" width="438" height="237" />

<h3>Pull, Pack, Publish</h3>

The plug-in offers three main operations: 

	<ul><li>Pulling NuGet packages required to build your project</li>
    <li>Creating NuGet packages</li>
    <li>Publishing Packages</li></ul>

In my case, I want to create the package and publish it. To give you a general idea of my build process, here's the outline of the build steps:

<img src="http://hhariri.files.wordpress.com/2011/08/buildoverview.png" alt="BuildOverview" title="BuildOverview.png" border="0" width="600" height="235" />

The NuGet related steps are 3 and 4. Step 1 simply builds the project by building the solution file. Step 2 runs the MSpec tests.

<h3>3. Building the package</h3>

This step is for building the actual package. We create a new Build Step in our project and select <strong>NuGet Packages Pack</strong>. This will give us the following configuration screen:

<img src="http://hhariri.files.wordpress.com/2011/08/step3.png" alt="Step3" title="Step3.png" border="0" width="600" height="460" />

As you can see, the configuration is pretty straightforward. Notice that in the Specification file, we can also provide a csproj file as opposed to a NuGet spec file. The advantage to this is that we do not have to redefine information such as version number and copyright information in the spec file. If you're not familiar with this feature, check out <a href="http://blog.davidebbo.com/2011/04/easy-way-to-publish-nuget-packages-with.html">David Ebbo's post</a>. 

I've also checked the option to <strong>Include Sources and Symbols</strong>. This is also explained in David Ebbo's post and it's for publishing the sources to <a href="http://symbolsource.org">Symbolsource</a>. Additional command line parameters (if required) can be passed in the <strong>Additional Commandline arguments</strong>. If you want to make this a release build, you can also do this by defining <strong>Configuration=Release</strong> in the <strong>Properties</strong> field.

Finally I've specified the Build number of the package using the TeamCity variable %build.number% which auto increments on each build, and is also used by another feature of TeamCity new in 6.5 which is called the AssemblyPatcher, which I'll show you as the last step. 


<h3>4. Publishing the package</h3>

The next step is to publish the package. As before, we need to add a Build Step and select <strong>NuGet Packages Publish</strong>. 

<img src="http://hhariri.files.wordpress.com/2011/08/buildstep4.png" alt="BuildStep4" title="BuildStep4.png" border="0" width="600" height="374" />

This step is even easier to configure. By convention it uses nuget.org as the destination to publish the package. If you have your own NuGet server then fill in the address in the <strong>Packages Sources</strong> field. If you're using nuget.org, leave it blank. You need to provide your API key which is stored in a password protected field and finally indicate which packages you want published. Here you can list each package individually or use wildcards. [Note: relative paths are allowed but at the time of writing this post, there was an issue and I was using the full path. This should be fixed soon]. 

If you want to publish to multiple sources, all you need to do is add another step. Note however that we did not have to specify an extra step to publish the sources to symbolsource.org. TeamCity will follow NuGet's convention and do this for you automatically. 

<h3>5. AssemblyInfo Patcher</h3> 

Although this step is optional I recommend you use it. The AssemblyInfo Patcher is a new Build Feature added to TeamCity which temporarily patches all your projects AssemblyInfo.cs files to update the version number, and then reverts it back after the build is complete. This allows your build number, artifacts, packages and assemblies to all have the same version number. Adding this option is as simple as selecting it from the main project configuration screen:

<img src="http://hhariri.files.wordpress.com/2011/08/assemblypatcher.png" alt="AssemblyPatcher" title="AssemblyPatcher.png" border="0" width="600" height="164" />

That's it. There's nothing more to it. With a few simple build steps we have now fully automated packaging and publishing NuGet packages. As I mentioned initially, if you've got your project on CodeBetter, you already have this feature enabled. If you're running your own server, just download the plugin and set it up. It's very simple. 

Try it out and please give us your feedback!
