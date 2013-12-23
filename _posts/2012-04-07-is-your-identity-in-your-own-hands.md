---
layout: post
title: Is your identity in your own hands?
categories:
- General
tags: []
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1366619127;}
  _wpas_skip_twitter: '1'
  _wpas_skip_fb: '1'
  _wp_old_slug: is-your-mail-in-your-own-hands
  _elasticsearch_indexed_on: '2012-04-07 09:05:05'
---
<em>If you're using a @gmail.com address, you should read this</em>

For quite a few number of years, I’ve switched my mail over entirely to GMail. By that, I don’t mean just using the Web Interface, but also making my @gmail.com address my primary one. Prior to that, I was using (and still handing out sometimes) my own domain address (@hadihariri.com).

Although GMail allows management of multiple accounts* when sending out emails, for a variety of reasons, including preventing setting up multiple accounts on different devices and apps, I made my @gmail.com account the default. This meant that every time I'd send out new email or respond to one, it would be sent out through my @gmail.com address.

Everyone was using GMail and handing out GMail accounts left and right, why shouldn't I?
<p align="justify">Even though I'd switched to GMail, for some time I was still using desktop apps for email, accessing GMail via POP/IMAP. And when it comes to these, I’ve tried them all, be it Outlook Express, then  Outlook, then The Bat, and so on and so forth. My main concern was having access to my email, be it whether I was traveling and didn’t have a connection or for back-up purposes. However, at some point, after being fed up with Outlook PST corrupt files, I gave up and went fully-fledge web. I thought, well Google’s going to do a hell of a better job of storing my email than I would, so forget this whole backup nonsense. Plus, GMail now offered a pretty decent offline experience, so win-win.</p>
<p align="justify">*[If you’re not familiar with this, you can change the setting under <strong>Settings | Account]</strong></p>
<p align="justify"><a href="http://hhariri.files.wordpress.com/2012/04/image.png"><img title="image" src="http://hhariri.files.wordpress.com/2012/04/image_thumb.png" alt="image" width="961" height="127" border="0" /></a></p>

<h1>Solving offline experience and backups</h1>
Despite Google never going down and having my mail backed up, the thought that all my email was somewhere where one day I could lose access to it, still haunted me. One solution I came up with was to enable offline storage of GMail for the maximum amount of time possible. Back then this was around 5 years. Guess what? It didn’t work. The experience became horrible (and yes they did warn you). Even with a connection, searching was horrendous. And on slow connections, it was dreadful. I soon gave up on that.

My other option was to use some third-party cloud service to back-up, giving them access to my GMail account. Something just didn’t entice me about that however.
<h2>The local backup</h2>
Having had Thunderbird installed for a secondary account I manage, I decided to switch back to desktop app for a while. So I set up GMail to use IMAP and all was good. I didn't last though. A lot of the features in the Web interface made working with mail much easier (grouped conversations, labels, etc.).

However, I did solve my backup problem. I configured Thunderbird to sync all messages and keep local copies:

<a href="http://hhariri.files.wordpress.com/2012/04/snaghtml4f44488.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="SNAGHTML4f44488" src="http://hhariri.files.wordpress.com/2012/04/snaghtml4f44488_thumb.png" alt="SNAGHTML4f44488" width="647" height="698" border="0" /></a>

Every day or every other day, I open up Thunderbird and let it churn away syncing my account. I now combine this with CrashPlan which then backs up my Thunderbird folders in the cloud.
<h2>All is good</h2>
All seemed good. I had my email backed up in three different places, GMail, my local machine and CrashPlan’s servers. I even had offline experience when I wanted using Thunderbird. What could possibly go wrong?

<a href="http://hhariri.files.wordpress.com/2012/04/image1.png"><img style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="image" src="http://hhariri.files.wordpress.com/2012/04/image_thumb1.png" alt="image" width="722" height="410" border="0" /></a>

30 seconds turned into more than 24 hours.

Last week, I lost access to GMail for nearly a day and a half. What was quite scary about it was that for the first 12 hours, it seemed I was the only one. Nobody else was having problems despite multiple times asking on Twitter and <a href="https://plus.google.com/104619260726652709787/posts/3jfQZSeBYmv">Googe+</a>.

At some point though I felt more relieved finding out I was not alone:

<a href="http://hhariri.files.wordpress.com/2012/04/better.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border:0;" title="better" src="http://hhariri.files.wordpress.com/2012/04/better_thumb.png" alt="better" width="510" height="801" border="0" /></a>

Realizing this could actually last for some time, I logged into my domain provider and stopped the forwarding of my @hadihariri.com accounts to @gmail.com. I created individual accounts for them and started using the Web Mail to access these. But guess what? Out of the more than +100 emails that were piled up in the short interval I had no access, only around 5-6 came through to my @hadihariri.com domains.

That’s when it struck me. <strong>Reaching me was in Google’s control</strong>.
<h2>Big deal. You lost email for 24 hours</h2>
Now you might be thinking that this isn’t such a big deal. That losing email for a day is not the end of the world. It is not. I could have actually been quite productive that day if I hadn’t been so concerned about reaching my email. However, what it made me realize is that I am dependent on Google to be reached.  Having switched over to GMail fully, and giving out my GMail account as the primary one, Google now controlled if and when people could reach me.

Now although GMail does not go down very often, and even if we consider they'd never terminate the free service (at some point when I read the TOS, it indicated that they could stop providing the service when they wanted to), there is always the possibility that Google can explicitly terminate <em>your</em> account, or block it for some unknown reason. I don’t have to link to explicit stories, but I’m sure if you search for accounts being blocked or deleted, you’ll come up with a ton of stories. And if none of that occurs, there is always the risk of someone hacking your account and deleting it.

In other words, your net existence, specially if you’re not very “social” and have Twitter, Facebook accounts, is exclusively in Google’s hands.

The sad thing about this is, that in my case, I put it there.
<h2></h2>
<h2>Steps to take</h2>
After this occurred, I took a few steps. I stopped making @gmail.com my default Reply-From and switched back to using my @hadihariri.com domain. I also took a few other steps, which I'd recommend you consider too:
<ul>
	<li><strong>Have a backup plan</strong>. Don’t rely exclusively on your mail provider. Whether you trust having a cloud service backup your email or go down the route I’ve taken to backup locally, doesn’t matter. But have a backup.</li>
	<li><strong>Make sure you own the identity you hand out</strong>. Have your own domain, specially if you are a business. Sure, you might lose your domain, but the chances of that happening are slim. And domains aren’t locked to providers.</li>
	<li><strong>Secure your account</strong>. If using Google, enable two-step verification. Also, try and limit who can and cannot access your Google identity as an OpenID provider. Don’t just trust any application.</li>
	<li><strong>Provide your domain account as your password </strong><strong>recovery</strong>. One other step I took was change some of the social networks I'm signed up to and provide an alternate email account for access/password recovery. In fact, even GMail asks for this. Make sure you don't lock it to @gmail.com since many services require confirmation of change of email address and if you lose access, you can't do it.</li>
</ul>
Of course, everything I say can be applied to Google, Hotmail, Yahoo or any other service providing you with a primary email address. It is far from my intention to single out Google or make Google look evil. I am the primary person responsible for these mistakes.

And while I hope I won't have to experience this again, I am glad I did. It was my wake-up call.
