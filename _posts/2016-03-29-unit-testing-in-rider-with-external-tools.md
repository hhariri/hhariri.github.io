---
layout: post
title: Unit Testing in Rider with External Tools
status: published
type: post
published: true
comments: true
---

*Disclaimer: we're working on first-class unit test support in Rider. This post is one of many possible workarounds until we provide proper support. It's not an official recommendation, but something I've found useful.*



<br/>
The IntelliJ platform comes with an option to configure and run external tools, known as, well [External Tools](https://www.jetbrains.com/help/idea/2016.1/external-tools.html). We can use this feature to configure Rider to execute the NUnit console runner from inside the IDE. While not much different from using the built-in terminal, it does save us in terms of a few keystrokes and has the ability to use macros to make it somewhat easier.

<br/>
![Running it]({{ site.images }}/external-tools-rider.gif)
<br/>

## Configuring External Tools
What we'll do is create two entries in External Tools: one for running all tests and the other to run a specific test class.

<br/>
![External Tools]({{ site.images }}/external-tools-rider-1.png)
<br/>

### Running all tests
To configure an external tool, we basically have to provide the executable to run along with any parameters. The key however is the ability to pass parameters, which can be macros. We can use this feature to create an external tool that is applicable to most projects.

<br/>
In order to do so, select Preferences (Settings) and search for External Tools. On the right pane, click on the plus sign to bring up the corresponding entry dialog

<br/>
For the case of running all tests, we basically need to invoke the NUnit console runner passing in the necessary parameters

<br/>
![NUnit Entry]({{ site.images }}/external-tools-rider-3.png)
<br/>
<br/>

Under Parameters we're providing the macro **$ProjectName$** with the suffix **Tests.dll**. In principle the suffix shouldn't be necessary. However currently there is no direct mapping of a macro that defines the actual project that's selected in the Solution Explorer, so we need to use this suffix, which ideally would need to match whatever convention you have in order to not have to redefine External Tools for each project.
<br/>

Under Working Directory, we again use a series of macros combined some suffixes that follow a convention. Once again, at a later stage, this most likely will not be necessary as Rider will provide more aligned macros.

<br/>
The rest of the options can be left as shown. The complete [reference guide](https://www.jetbrains.com/help/idea/2016.1/external-tools.html) gives more insight into each option.

### Running a single class
While we cannot run a single test, we can run individual classes. Fortunately one of the macros that Rider provides is **$SelectedText$** which refers to the currently selected text. Passing this value as the parameter to the **-run** parameter of the NUnit console runner, we can easily run a single test class

<br/>
![NUnit Class Entry]({{ site.images }}/external-tools-rider-4.png)
<br/>

### Assigning key bindings
With these two entries in External Tools, we can now run all tests or a specific test class. The only thing that's left is to assign a key binding to them to make it a little bit more efficient.

<br/>
We can do this under Preferences (Settings), Keymap. Find the corresponding entries for each External Tool, hit Enter and select *Add Keyboard Shortcut*

<br/>
![Keymapping]({{ site.images }}/external-tools-rider-5.png)
<br/>
<br/>

Now we can simply select a class (remember to use use Extend Selection (Alt+Up on OSX or Ctrl+W) on the classname), and hit the corresponding key binding to run just that class.


### Compile before running
One issue with this workflow is that calling the external tool doesn't automatically compile the code. However, given that we often have the impulse to save our work (which isn't necessary in Rider or IntelliJ IDE's as they're always saving), we could assign the Save All action (Cmd+S) to actually build the solution. With this simple key mapping, we can fall into the habit of hitting Cmd+S and then invoking the external tool.

<br/>
Finally, I've created two entries here: one for running all tests and another for running a single class. The console runner allows other things such as categories, which combiend with **$SelectedText$** macro could be used to run specific categories too.

<br/>
Once again, please note that this is merely a proposed workaround which you're free to use until we provide proper support for Unit Testing in Rider.


