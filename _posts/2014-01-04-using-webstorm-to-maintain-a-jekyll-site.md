---
layout: post
title: Using WebStorm to maintain a Jekyll site
status: draft
type: post
published: true
comments: true
---

I've recently moved this blog over to Jekyll and hosting on GitHub Pages and I've been using WebStorm
for maintaining both my blog and some new web sites I'm working on.

It's working out really well so I thought I'll share a few tips and tricks I'm using, if you could call them that.

## Install the Markdown plugin

WebStorm does not ship with Markdown support out of the box, but you can easily install the Markdown plugin. While Jekyll supports various flavors of markdown (I'm using Kramdown), the all share some common
syntax, so you're good to go with the general Markdown plugin.


1. Open up Preferences (Cmd+, on OSX)
2. Type 'plugin' to go directly to the Plugin tab
    ![Plugin Preferences]({{ site.images }}/webstorm-guide-1.png)
3. Click on 'Browse Repositories'
4. Search for 'Markdown'
5. Right-click to install
    ![Markdown install]({{ site.images }}/webstorm-guide-3.png)

Alternatively, you could also create a file with extension *.md* and WebStorm will automatically detect there is a plugin available and prompt you to download and install it.
    ![Markdown auto install]({{ site.images }}/webstorm-guide-2.png)


## Find posts and other files efficiently

WebStorm allows you to navigate to files very quickly. If you're using the latest WebStorm, just double-click the *Shift* key to go to *Search Everywhere*. Alternatively choose the shortcut
associated with *Go To File* (Cmd+Shift+O on OSX)

Remember, you can even use wildcards.

![Search Everywhere]({{ site.images }}/webstorm-guide-4.png)

## Move files around properly

Often you might want to move files around on your site. For instance you might have a folder called *drafts* where you keep draft posts. When it's time to move them, you can of course
drag and drop from one folder to another, but it's often cumbersome. Instead use the Move refactoring (F6 on OSX)

![Move File]({{ site.images }}/webstorm-guide-5.png)

## Create new post and other types of files fast

WebStorm provides a very smart file template system that allows for creation of files. In fact, when you invoke the New command in WebStorm (Cmd+N) you're using templates to create
new files.

![Cmd New]({{ site.images }}/webstorm-guide-6.png)

The last entry is to edit file templates, allowing to create new ones, ideal for Jekyll templates.

Most Jekyll files consist of a header containing some metadata. For instance these post has:

    ---
    layout: post
    title: Using WebStorm to maintain a Jekyll site
    status: draft
    type: post
    published: true
    comments: true
    ---

I've created a file template so that I don't have to copy/paste this each time:

![File Template]({{ site.images }}/webstorm-guide-7.png)

Now when creating a file, I'm prompted with a dialog to fill out the information:

![Prompt dialog]({{ site.images }}/webstorm-guide-8.png)

For more information on variables and possibilities see [File Variables](http://www.jetbrains.com/idea/webhelp/file-template-variables.html#predefined_template_variables)

## Save on keystrokes

Much like file templates, you can also save on keystrokes when working with common constructs with Jekyll. Liquid, the templating engine requires certain syntax for
variable substitutions and other functionality.

I've created a set of live templates with WebStorm to help me with this:

![Live Templates]({{ site.images }}/webstorm-guide-9.png)

making things a little quicker. Now I can simply type for instance *iu* and get the template expanded, filling in the gaps. You can do the same for emphasis, bold, keywords, etc.



## Configure *jekyll serve* as an external tool

WebStorm comes with built-in support for a terminal, so you don't need to switch applications to run shell commands. This means that you could just open up the terminal
and run

    jekyll serve --watch

from there. But you can also configure Jekyll as an external tool and have it available from the menu option

![Jekyll Tool]({{ site.images }}/webstorm-guide-10.png)

You can configure it via **Preferences**, **External Tools**

![Jekyll Tool Configuration]({{ site.images }}/webstorm-guide-11.png)


## Publish from inside WebStorm

If you enable VCS support inside WebStorm, it will automatically detect new files being added and will prompt you to add it to your Git Repository. Much the same way
it detects modified and deleted files. Once you're ready to publish (or just commit), you can hit

## Spell Checker

Not much to configure there. It's built in and works. Just hit Alt+Enter when you make a spelling mistake

![Spelling mistakes]({{ site.images }}/webstorm-guide-12.png)

You can also provide custom dictionaries for any language via **Preferences**.

## Web related features

Of course, there's a whole bunch of other features I've not covered that you can use from WebStorm for web site maintenance including CSS, LESS, SASS and other style editing

PIC OF CSS selector

