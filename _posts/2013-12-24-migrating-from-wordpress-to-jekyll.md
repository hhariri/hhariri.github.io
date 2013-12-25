---
layout: post
title: Migrating from WordPress.com to Jekyll
status: publish
type: post
published: true
---

### Why migrate?

I was using a hosted solution of WordPress on WordPress.com with a custom domain. I didn't have control over the plugins I could install or certain things I wanted
to do. I found it limiting.

While I've been thinking of doing the move for quite some time, recently I've been working on a new site using GitHub Pages / Jekyll and enjoyed the experience, so finally decided to move.


### What is Jekyll?

For those not familiar, [Jekyll](jekyllrb.com) is a static web site generator written in Ruby. It uses a template engine named Liquid which supports HTML as well as various flavours of
markdown. You write your posts in HTML or markdown and run Jekyll, which then generates the entire site for you. Every page is therefore static.


### Where do you host it?

It's static HTML so you can host it pretty much anywhere. Fortunately the kind folks at GitHub not only offer free hosting for project and personal web sites under GitHub Pages,
but GitHub also has intrinsic knowledge of Jekyll. What this basically means is:

1. You generate your content
3. You push your changes
4. GitHub automatically runs Jekyll for you and generates the site

thus making the whole publishing process much more streamlined. And, you don't need to upload your entire site every time.


### How to do it

I'm not going to provide detailed instructions on each of the steps, as it would lead to a very long post. Instead I'm going to outline the
process I followed, link you to the full detailed steps and highlight some tips or gotchas I encountered.

Also I should mention that there are a few *automated importers*. I tried one and I wasn't too successful. I also wanted to understand better the process so I decided to take the
semi-automated approach.

Finally, [Phil Haack](http://haacked.com) has also recently migrated and written a [few](http://haacked.com/archive/2013/12/02/dr-jekyll-and-mr-haack/) [posts](http://haacked.com/archive/2013/12/03/jekyll-url-extensions/). Albeit he migrated from SubText.


#### Outline

The process is:

* Setup a GitHub Page / Repo / Site
* Setup a theme
* Import Posts
* Import Comments
* Setup a few other things (analytics, rss feed)
* Go Live


#### Setting up Jekyll and skeleton site

1. Get yourself a [GitHub Personal Page set up](http://pages.github.com/), which gives you username.github.io. We'll see custom domains later on.

2. Clone it locally.

3. [Install Jekyll](http://jekyllrb.com/)

4. Generate a site using:

        jekyll new sitename

    This generates a folder named 'sitename'. Copy the contents of this folder to your recently cloned directory.

    Quick explanation of the layout of the site:

    * *_config.yml* is the configuration for the site. Variables and Jekyll parameters are defined in this file
    * *_posts* contains all posts. Jekyll follows a specific file name: yyyy-mm-dd-title.md
    * *_layout* contains templates which are used by Liquid for layout

    [Certain folders](http://jekyllrb.com/docs/structure/) such as *_posts*
    (special ones start with underscore), are processed when Jekyll is run. In particular, all entries in the _posts
    folder are processed and corresponding post entries are created.

    All generated files are placed in a folder named *_site*.

    You can create other folders such as *images* or *css* and these will be copied verbatim to *_site*

5. At this point decide whether you want to stick to the default theme Jekyll generates or use some [existing theme](jekyllthemes.org). Why now? Because a lot of the themes
modify more than just CSS and layout files, so it would be good to have the base on which to work on. You can always tweak things later of course.

6. Make sure it all runs. Type:

        jekyll serve

on the command line, open up http://localhost:4000 and you should see the site.

*Note:* I usually add the '--watch' parameter to the command so that I don't have to start/stop each time I make a change (except if you change *_config.yml* file, you always need to restart for that).


#### Importing Posts

Once you have the skeleton running, next step is to import posts.

1. Go to your Dashboard on your WordPress blog and export your posts. Pick to export everything

![WordPress Export]({{ site.images }}/jekyll-1.png)

2. [Install some Jekyll import tools](http://import.jekyllrb.com/)

3. [Run the import for WordPress](http://import.jekyllrb.com/docs/wordpressdotcom/). Run this from the root folder of the new site and point to the location of the recently exported WordPress contents:

        $ruby -rubygems -e 'require "jekyll-import";
            JekyllImport::Importers::WordpressDotCom.run({
            "source" => "wordpress.xml"
        })'

4. If all goes well, you should now have all your posts in the _posts folder.

5. Posts are imported as HTML and that's fine. While Liquid usually works with Markdown (by default uses RedCarpet), HTML inside markdown or complete HTML files will work fine.
I haven't bothered converting old posts to markdown so I've left them as is. There are HTML to Markdown converters if you decide to convert.

6. Images. This was the big one. When importing posts, the importer creates a folder named _attachments that has metadata about every image. However, it doesn't (or I've missed the fact) of how it actually
downloads the original images. This means you need to somehow retrieve the images from your post and update the corresponding posts with the new references. Tedious work which depending
on the number of posts you might want to automate.

7. Snippets. The next step for me was to get rid of the Gists I had for syntax highlighting and one of the many reasons I wanted to move off of WordPress, to allow for syntax highlighting.
Jekyll by default uses [Pygment](http://pygments.org). This means that you get [syntax highlighting](http://jekyllrb.com/docs/templates/) for a variety of languages out of the box.

Tweak any other issues you may find and run 'jekyll serve --watch' again to make sure it all works.


#### Maintaining URL's

What you want to do when moving blogs is keep your existing URL's or setup redirects. I opted for keeping existing ones. WordPress usually follows the format:

    http://domain.com/year/month/day/title

In order to have this same format in Jekyll, add the following line to *_config.yml*

    permalink:    /:year/:month/:day/:title/

Jekyll allows a variety of [permalinks](jekyllrb.com/docs/permalinks/).


#### Setting up Comments

One issue with leaving WordPress is that you lose comments. While you can use your own custom script, database et al to set up a comment system, I've chosen to go with
[Disqus.com](http://disqus.com).

1. Create an account on Disqus.com and set up a new site.

2. Install the script required in the layout page corresponding to your posts


#### Importing Comments

1. On the Discussions Panel on Disqus, find the Import option to import the comments.

![Disqus Import]({{ site.images }}/jekyll-2.png)

2. Upload the file you exported previously from WordPress, which should contain comments too.

3. Wait for it to complete.

    Disqus associates comments with a post using the URL. If you keep the same URL format from WordPress to Jekyll, then once you point your domain to the new site, it should all work.
    If you don't, Disqus offers various options on associating posts with comments. Phil Haack [recently blogged](http://haacked.com/archive/2013/12/09/preserving-disqus-comments-with-jekyll/) about one way using hidden fields.


#### Setting up Statistics

WordPress offers statistics. Jekyll does not. I switched to Google Analytics, which basically consists of:

1. Setting up an account with [Analytics](http://www.google.com/analytics/)

2. Insert some code snippet at the bottom of the layout pages


#### Setting up an RSS subscription

Again, that's something that WordPress offers and Jekyll does not. You can use [Feedburner](http://feedburner.com). Fortunately I've always kept my RSS feed on there so that even if I move blog, I don't lose my subscribers.


#### Setting up a custom domain

If you have a custom domain, like in my case, hadihariri.com, you can set it up so that when someone goes to username.github.io it redirects to the domain.

1. Create a new file named CNAME in the root of your site and add a single line which is your domain name (i.e. hadihariri.com)

2. Setup a A record for your domain name to point to the correct IP address. [See this page for the IP address](https://help.github.com/articles/setting-up-a-custom-domain-with-pages)


#### Go Live

Once you're ready:

    git push

Wait a few minutes and you should see your new site. If something goes wrong, you'll get an email from GitHub. I recommend you always try generating locally using

    jekyll serve

before pushing.


#### Maintaining the site

You can of course use any editor now to write content and if these support markdown, even better. Personally I use WebStorm and it works extremely well. I've got a few
templates set up to create new posts, it offers spell checker, and it also helps when working with styling and refactoring elements.


### Not done yet

I've still not completely finished the migration. Still have some tweaking of the design, and fixing up previous content, but I thought I'll write this guide out seeing I
 have everything more or less fresh still. It might suffer some adjustments.


