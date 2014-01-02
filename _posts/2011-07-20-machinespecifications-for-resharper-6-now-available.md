---
layout: post
title: Machine.Specifications for ReSharper 6 now available
categories:
- JetBrains
tags:
- Machine.Specifications
- ReSharper 6
- Unit Testing
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1385704306;}
  _elasticsearch_indexed_on: '2011-07-20 14:07:45'
comments: true
---
Many, myself included, have been eagerly awaiting the release of the ReSharper Runner of Machine.Specification (MSpec) for ReSharper 6. I’m glad to announce that this is now available, which is the result of a team-effort between <a href="http://twitter.com/kropp">Victor Kropp</a>, <a href="http://twitter.com/#!/lucisferre">Chris Nicola</a>, myself and of course <a href="http://twitter.com/#!/agross">Alexander Gross</a>, long-time contributor and main maintainer of the MSpec project.

NuGet packages have already been updated to support ReSharper 6. The source code can also be obtained via <a href="http://www.symbolsource.org/">SymbolSource.org</a> if using NuGet or directly from <a href="https://github.com/agross/machine.specifications">Alexander’s GitHub account</a>.

<strong><a href="http://hhariri.files.wordpress.com/2011/07/snaghtml5fd19d5.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:10px 0 0;" title="SNAGHTML5fd19d5" src="http://hhariri.files.wordpress.com/2011/07/snaghtml5fd19d5_thumb.png" alt="SNAGHTML5fd19d5" width="753" height="324" border="0" /></a></strong>

<strong>Installing the Runner in ReSharper 6</strong>

If you’re new to MSpec or have simply forgotten how to install the runner under ReSharper, here are some simple steps to use Mspec in your project and integrate it with ReSharper:

<strong>1</strong>. Run the command <em>install-package</em> <strong>Machine.Specifications </strong>(or <strong>Machine.Specifications-Signed</strong> if you want the signed version). If this is an existing project, issue the command <em>update-package </em>instead of <em>install-package</em>.

<strong>2</strong>. Inside the packages folder corresponding to Machine.Specifications, a <em>tools</em> folder is created with a series of assemblies and some batch files. There are a series of batch files named InstallResharperRunner.X.X. – VS20XX.bat where X’s correspond to the version of ReSharper and of Visual Studio. By executing the corresponding one, it will copy the assemblies to the ReSharper plug-in folder.

You can of course do the second step manually, by copying the Machine.Specifications.ReSharperRunner.X.Y files to the ReSharper Plugins folder, located either under the ReSharper bin folder in %Program Files%\JetBrains\ReSharperX\bin (for all users) or under %APPDATA%\JetBrains\ReSharperX\bin (user-specific settings).

With that you should be up and running.

Enjoy.
