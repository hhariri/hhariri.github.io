---
layout: post
title: No Tabs in IntelliJ IDEA
status: published
type: post
published: true
comments: true
---

I often come across people complaining about some odd behaviour when it comes to editor tabs in IntelliJ IDEA or any of the other sister products such as WebStorm or PhpStorm. Some expect
a different kind of behavior from tabs. Others want the ability to have different colored tabs and some want them numbered. 

<br/>
My advice to all of them? Switch tabs off.
You don't need tabs. 
<br/><br/>
Here's your typical layout with Tabs
<br/><br/>
![No Tabs]({{ site.images}}/no-tabs-1.png)

### No more Tabs

That's taking up realestate and it's not providing you with much value other than confusing the hell out of you when you're looking for that specific index.html file and there
are a few of them open. And when you want to navigate to the different tabs, you either have some shortcut key assigned to loop through them or you're using your mouse! 

<br/>
Bad. Don't use the mouse. And here's what you do with Tabs:
<br/><br/>
![Settings]({{ site.images}}/no-tabs-2.png)

## But, how do I move back and forth?

Use the keyboard with a few different options (I'm using OSX 10.5+ layout):

### Recent files

Navigate to the recent files you've just been looking at: **Cmd+E**
<br/><br/>
![Recent Files]({{ site.images}}/no-tabs-3.png)
<br/><br/>
If you want to see the recent files you've just edited: **Shift+Cmd+E**
<br/><br/>
![Recent Edits]({{ site.images}}/no-tabs-4.png)
<br/><br/>
And you can use the Switcher to do even faster switches: **Ctrl+`**
<br/><br/>
![Switcher]({{ site.images}}/no-tabs-5.png)

### Find Types and Files

* If you want to find a type, **Cmd+O**. 

* If you want to find a file, **Shift+Cmd+O**

* If you want to look for a symbol, **Alt+Cmd+O**.

Or you can just press **Shift twice** and get Search Everywhere. 
<br/><br/>
![Search Everywhere]({{ site.images}}/no-tabs-10.png)
<br/><br/>
Noticed how Search Everywhere by default lists Recent Files? 
<br/><br/>
And remember, most of these dialogs admit patterns such as wildcards, CCC (CamelCaseCompletion), and even going to a specific line number:
<br/><br/>
![Line Number]({{ site.images}}/no-tabs-9.png)

### Recent Positions

* If you want to move back and forth between where you are and where you just were: **Cmd+[** to go back and **Cmd+]** to go forward. Of course, if your current and previous position is in different files, it will also go back and forth between them.
* If you want to go to the last edited position: **Shift+Cmd+Backspace**

### Bookmarks

You can also toggle bookmarks using **F3** (mark) and **Alt+F3** (unmark), navigate between them and also display bookmarks:

![Bookmarks]({{ site.images}}/no-tabs-11.png)


### Project Structure

The Project Structure can help you easily locate files. First off, hide it and activate it using **Cmd+1**. Secondly, while having it open you can just start typing to quickly locate a file

![Project Structure]({{ site.images}}/no-tabs-7.png)
<br/><br/>
Once you locate the file, hit **F4** or **ESC** to change to focus to the editor. Incidently, if you want to autoscroll to source (or from source), hit the Gear icon on the 
Project window and activate it:
<br/><br/>
![AutoScroll]({{ site.images}}/no-tabs-8.png)

### Navigation Bar

Make sure you turn that off also. If you ever need it, invoke it using **Alt+Fn+LeftArrow**
<br/><br/>
![Navigation Bar]({{ site.images}}/no-tabs-12.png)
<br/><br/>
And remember, you can even invoke the New File Command with **Cmd+N** (only way you should be creating files, packages and folders) on the Navigation bar. It's context-aware. 
<br/><br/>
![New File]({{ site.images}}/no-tabs-13.png)

### Many ways to navigate

As you can see, there are many ways to navigate a project inside IntelliJ IDEA that doesn't necessarily include having to look through a list of tabs and figure out where you have to 
click next. 

