---
layout: post
title: Losing templates on ReSharper upgrade
categories: []
tags:
- ReSharper
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2010-08-16 17:09:11'
---
<a href="http://twitter.com/derickbailey">Derick Bailey</a> pointed out today on Twitter that during an upgrade, he lost his <a href="http://www.jetbrains.com/resharper">ReSharper</a> templates.

ReSharper should import the existing templates during an upgrade. However, for some odd reason, sometimes this does not occur. We managed to sort out Derick’s issue relatively quickly, but in case others might run into the same problem, here’s how to solve it:

<em>Scenario: Upgrading from 5.0 to 5.1 in VS2010 and settings lost.</em>

1. Close down Visual Studio 2010.

2. Go to the %AppData%\JetBrains\ReSharper folder. In there you should find subfolders for each version of ReSharper. Select v5.0.

Inside each folder there are subfolders corresponding to the different versions of Visual Studio you have installed on your machine. Select vs10.0 (corresponds to VS 2010).

3. Select the files <strong>UserSettings.xml </strong>and <strong>Workspace.xml.</strong>

4. Copy the selected files to %AppData%\JetBrains\ReSharper\v5.1\vs10.0

5. Re-start Visual Studio

&nbsp;

If all goes well, you should now have your settings correctly imported. If you have run into this problem, please feel free to contact me. We need information on setups to try and see what the common denominator is for when this fails (also please store the contents of these folders since it might help us figure out what’s wrong).
