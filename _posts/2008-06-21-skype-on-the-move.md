---
layout: post
title: Skype on the move
categories: []
tags: []
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-06-21 10:57:00'
comments: true
---
<p>Skype is a pretty complex program in the sense that it has quite a lot of options. However, one thing lacking is an option to configure where you want your data files stored. Whether it&#039;s history, pictures, received files, etc.. none of these are available for you to configure from the user interface. Now as a developer, I would think why haven&#039;t they built in this functionality? It doesn&#039;t take much to foresee that someone might want to change the location. </p>  <p>The funny thing is that they actually do have all of this built in. You can configure the locations of pictures and received files in the config.xml file that is in the data files folder. The entries are:</p>  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Avatar&gt;C:\Documents and Settings\.....&lt;/Avatar&gt;   <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;AvatarPath&gt;C:\Documents and Settings\.....&lt;/AvatarPath&gt;    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;ContentPath&gt;C:\Documents and Settings\....&lt;/ContentPath&gt;</p>  <p>This is great, but where is the data folder located? Well by default Skype creates it in the Application folder (C:\Documents and Settings\User\Application Data\Skype) which kind of sucks for those of us that have our data on a different drive. There is no where in the options to change this. There&#039;s no configuration file in the application executable folder either. There&#039;s not even a registry entry. Nope. Skype have made it so easy that it&#039;s not even obvious. To change the location where your data is stored, pass it in on the command line:</p>  <p>skpe.exe /datapath:D:\MySkypeData </p>  <p>You can even make it portable by passing in /removable also. This prevents your password from being saved. Great for USB sticks. </p>  <p>What I find amazing is that if these developers have gone through the &quot;hard&quot; part of making this all configurable, why wouldn&#039;t they just add an option to the user interface?</p>
