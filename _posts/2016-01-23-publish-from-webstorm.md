---
layout: post
title: Publish to Leanpub from WebStorm
status: published
type: post
published: true
comments: true
---

I'm a really big fan of [Leanpub](https://leanpub.com), a self-pubishing site that not only gives authors a really sweet deal but
also provides an amazing experience when working with it.

<br/>
Simply put, you sign up, link up your Dropbox folder. It creates a folder for you with a manuscript subfolder where you write your chapters using Markdown. Once you're done
you publish your book and put it up for sale!

<br/>
![Leanpub Folder]({{ site.images }}/leanpub-folder.png)
<br/>
<br/>

They handle everything for you in terms of transactions, and you can even push your books to Amazon, albeit they make a much bigger cut than Leanpub do (which is approximately 10%).


<br/>
Of course, Dropbox is just one of the multiple options. You can also use Git/GitHub amongst other alternatives.

### Previews and Publishing

I use WebStorm for writing Markdown, which by the way, now comes with a really sweet Preview window using JavaFX

<br/>
![Leanpub Preview]({{ site.images }}/leanpub-markdown-preview.png)
<br/>
<br/>

I've already written about some tips and tricks for working with [Markdown and WebStorm](http://hadihariri.com/2014/01/04/using-webstorm-to-maintain-a-jekyll-site/) so won't rehash them here.


<br/>
While the experience is great I found there was a missing part. Leanpub allows you to generate previews to see progress of your book. In order to do this, you need to go
to the website and do it via your author dashboard. It's not a big deal but it does prove somewhat cumbersome, especially if you want to generate these frequently.
<br/>
<br/>
And that's where my [plugin](https://github.com/hhariri/leanpub-plugin) comes in. Given I've been working extensively with Leanpub recently (soon to be revealed, and no it's not what you think), I wrote a simple plugin that uses Leanpub's API
to generate previews, as well as publish directly from WebStorm*
<br/>
<br/>
To use it, you simply install the plugin and configure the API and slug, which can be obtained from your [Leanpub author dashboard](https://leanpub.com/author_dashboard/settings)

<br/>
![Leanpub Config]({{ site.images }}/leanpub-config.png)
<br/>
<br/>

Once configured, you can simply use the menu entries to generate previews and/or publish your book. Leanpub then generates these in multiple formats and places them in the preview and published
folder respectively in your Dropbox.

<br/>
![Leanpub Tool menu]({{ site.images }}/leanpub-toolmenu.png)
<br/>
<br/>


Currently it does not support partial preview generations, but I'll get round to it. And given it's OSS, please feel free to fork and contribute!
<br/>
<br/>

*It actually works on IntelliJ IDEA, WebStorm or any of our other IDE's.