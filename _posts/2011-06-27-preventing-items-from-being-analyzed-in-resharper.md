---
layout: post
title: Preventing Items from being analyzed in ReSharper
categories:
- JetBrains
tags:
- JetBrains
- ReSharper
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1386096526;}
  _elasticsearch_indexed_on: '2011-06-27 06:05:46'
---
With the imminent release of <a href="http://www.jetbrains.com/resharper">ReSharper</a> 6, and support for JavaScript as well as CSS, we’ve had a few people ask us how to prevent ReSharper 6 from detecting issues in certain files that are not supported, for instance .less. Although many operations are available for these types of files, including "Move To Folder" (and consequent reference updates), analysis is not currently available.
<h2>Eliminating Items from Analysis</h2>
ReSharper allows us to completely exclude specific files and folders from Analysis. Currently, it does not support file masks, so we cannot tell it to ignore all *.less files. What we can do however is place all files of a certain type into a folder and add that folder to be excluded. To do this, we first move the specific files by using the "Move To Folder" refactoring and create a new folder called <em>less </em>for instance (which can be created using the same dialogue box).

In order to now exclude this folder, we need to go to <strong>ReSharper | Options | Code Inspection |Settings</strong>

<img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="SNAGHTML2c0fc9" src="http://hhariri.files.wordpress.com/2011/06/snaghtml2c0fc9_thumb1.png" alt="SNAGHTML2c0fc9" width="589" height="403" border="0" />

and click on the <strong>Edit Items to Skip </strong>button.  This now provides us the ability to add specific files and/or folders to list of items to skip.

<img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="SNAGHTML2d02ce" src="http://hhariri.files.wordpress.com/2011/06/snaghtml2d02ce_thumb1.png" alt="SNAGHTML2d02ce" width="308" height="304" border="0" />

We then click on <strong>Add Folder</strong> and select the newly created folder (less).  Once we do that, all analysis on the skipped items will stop. Obviously this is available for any kind of file so you can add anything there.

Note: You can also add/remove files and folders quickly by pressing the shortcut key Ctrl+Shift+Alt+8.

In the case of CSS/.less, if you still see squiggles under certain elements, that is Visual Studio error highlighting, not ReSharper. You can turn that off using <strong>Tools | Options | Text Editor | CSS | Miscellaneous. </strong>
<h3>Generated Code</h3>
Below the previous menu option, there is another entry <strong>Generated Code</strong>:

<a href="http://hhariri.files.wordpress.com/2011/06/image1.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="image" src="http://hhariri.files.wordpress.com/2011/06/image_thumb1.png" alt="image" width="600" height="622" border="0" /></a>

How is this different from the above? The entries on this page, which do allow masks (as well as regions), do get analyzed, yet no hints, warnings, suggestions or quick fixes are offered since it does not make much sense. However, and this is important, files still do get analysed to provide error information and completion. This is what makes <strong>Generated Code</strong> different from <strong>Items to Skip</strong>.

Note: In ReSharper 6 and below, Generated File Masks and Generated Code Regions are GLOBAL and not Solution based. However, they can only be edited when a solution is open. This will be solved in a future release along with other improvements in the area of settings across solutions/projects.
