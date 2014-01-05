---
layout: post
title: Adding a Profile Box to Windows Logon
categories: []
tags: []
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-02-14 07:53:44'
comments: true
---
&nbsp;

<a href="http://www.codinghorror.com">Jeff Atwood</a> posted an <a href="http://www.codinghorror.com/blog/archives/001056.html">entry</a> a couple of days ago about adding a checkbox to the Windows dialog boxes to display your password while typing, as opposed to just asterisks. I don't particularly agree with the idea of displaying passwords since I don't think it's that useful. Think about it. If the purpose is to display the characters you're typing so as to know if you're making a mistake, why not just reveal it all the time? Why would it make sense to reveal only if there's nobody looking over your shoulder? You'll probably be more nervous and make mistakes when someone is watching you.

But the whole idea got me thinking about how many times we have to enter passwords and in general validate our identity to different systems. I log on to my machine in the morning and type in the password. I start up Outlook and enter my password (or hit the Remember Password box the first time). I log on to GMail and enter my password. I start my VCS and enter the username and password. Why couldn't I just enter my username and password once and have it work for all my application? Applying this idea to the web, Microsoft tried to implement something similar using Microsoft Passport. The reason it didn't take off is obvious: you wouldn't want to your entire life in the hands of one entity. Also, having all the different web sites use the same set of credentials is as a good an idea as using the same password for everything. The next step was/is Federated Security and Windows CardSpace, where either yourself or independent authorities validate your credentials to third-parties, however that's another topic in itself.

However, what if we were to apply the same concept to our machine? My main machine is a laptop and I travel quite a bit. As such, I'm quite paranoid about privacy. I have everything encrypted and in case one day my laptop gets stolen, they can't really do much with the information (unless they snatch it out of my hands while I'm working, but that's another problem). I also have everything protected by credentials (TrueCrypt, KeePass, etc.). But when I'm at home, why should have to keep typing in my credentials for each application I want to access? Why can't I just indicate to Windows that I'm at home and don't bother asking my about my information (i.e. when Jeff Atwood talks about having a checkbox on the password entries, make this configurable based on location when you login to Windows).

Let's take it one step further: why restrict this to location? Why not take it to the next phase and create security profiles for the same user? Based on a security profile I select, I could have my different applications ask me for credentials or not. There are many ways we could implement this. Browser and other applications could use a common API to retrieve such information about Windows. There wouldn't even be a need to store credentials. It's pretty much the same idea as using Windows authentication with your applications, combined with different profiles for different users but under the same username, i.e. take make use of the various technologies and techniques we currently have.

<a href="http://hhariri.files.wordpress.com/2008/02/6.png"><img class="alignnone size-full wp-image-653" title="6" src="{{ site.images }}/profile-1.png" alt="" width="244" height="175" /></a>

I can't find an immediate downside to this but as with everything, it might have it's flaws. Has this already been thought of or does it exist? If it has, it's definitely not mainstream.
