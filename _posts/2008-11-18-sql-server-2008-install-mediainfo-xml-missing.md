---
layout: post
title: SQL Server 2008 Install – MediaInfo.xml missing
categories: []
tags:
- Tools
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-11-18 12:08:08'
---
<p>I was installing SQL Server 2008 today (x64 bit version) and after the initial checks it does, I got an error about MediaInfo.xml file missing. Looking in the folder where it had unpacked the files, effectively I couldn't find a reference to it. After a <a href="http://www.google.com">very hard session of extensive research</a>, I found that others had run into similar issues. Some of the suggested solutions were to re-install .NET 3.5 SP1. Others said to re-install the complete .NET framework. One guy had re-installed his entire OS and still had issues. </p>  <p>Clearly not being the path I wanted to go down, I decided to try and install the 32 bit version to see if it was a problem with the 64 bit. This one seemed to go ahead with the install. Looking at the decompressed files, I saw that the missing files were there on the 32 bit. I then cancelled the install and ran the 64 bit one again. After decompressing the files, the missing files were also there. I thought maybe I had a bad run and let it continue. However once it did all the checks and I hit Continue, suddenly half of the files were deleted from the folder. So it seems that at some point the installer was deleting the files. </p>  <p>So instead of running the installer bootstrap, I decompressed the files and ran the setup manually. And it worked. So if you get a errors on missing files, decompress the package and run the setup.exe manually and it should work ok.</p>
