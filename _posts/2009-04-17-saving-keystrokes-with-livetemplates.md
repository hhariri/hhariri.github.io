---
layout: post
title: Saving keystrokes with LiveTemplates
categories: []
tags:
- ReSharper
status: publish
type: post
published: true
meta:
  enclosure: |
    http://hadihariri.com/screencasts/livetemplates.avi
    1505
    video/avi
  _elasticsearch_indexed_on: '2009-04-16 23:13:09'
---
<p>One of the cool features Resharper has is to allow you to define live code templates, i.e. snippets that you can interact with. Say for example you continuously type:</p> <p>&nbsp;</p> <div> <div style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;padding:0;"><pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:white;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> var customerServices = <span style="color:#0000ff;">new</span> Mock&lt;ICustomerServices&gt;();</pre></div></div>
<p>&nbsp;</p>
<p>each time you want to mock out a service. You could shorten this to only typing:</p>
<p>&nbsp;</p>
<blockquote>
<p><em>mock&lt;TAB&gt;customerServices&lt;TAB&gt;&lt;ENTER&gt;</em></p></blockquote>
<p>and here's how: </p>
<p>1. Resharper -&gt; Live Templates</p>
<p>2. Under User Templates, create a new one</p>
<p>3. Type in: var $name$ = var Mock&lt;I$interface$&gt;(); </p>
<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_2.png"><img style="border-right:0;border-top:0;border-left:0;border-bottom:0;" height="160" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_thumb.png" width="339" border="0"></a> </p>
<p>4. Give it the ShortCut name of "mock" (or whatever you please)</p>
<p>5. On the right-side of the Window, click on the Choose Macro on the <strong>name</strong> entry</p>
<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_4.png"><img style="border-right:0;border-top:0;border-left:0;border-bottom:0;" height="105" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_thumb_1.png" width="343" border="0"></a> </p>
<p>6. Pick <strong>Constant Value</strong> and close the dialog</p>
<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_6.png"><img style="border-right:0;border-top:0;border-left:0;border-bottom:0;" height="285" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_thumb_2.png" width="270" border="0"></a> </p>
<p>7. Click on the <strong>Constant Value</strong> again on the right-hand side</p>
<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_8.png"><img style="border-right:0;border-top:0;border-left:0;border-bottom:0;" height="105" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_thumb_3.png" width="331" border="0"></a> </p>
<p>8. Enter a value, for example mockObject</p>
<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_10.png"><img style="border-right:0;border-top:0;border-left:0;border-bottom:0;" height="115" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_thumb_4.png" width="301" border="0"></a> </p>
<p>9. Repeat the same process (Choose Macro) for the <strong>interface</strong> entry, but this type choose the following option:</p>
<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_12.png"><img style="border-right:0;border-top:0;border-left:0;border-bottom:0;" height="317" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_thumb_5.png" width="301" border="0"></a> </p>
<p>10. Set the variable by clicking on <strong>another variable link</strong>:</p>
<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_14.png"><img style="border-right:0;border-top:0;border-left:0;border-bottom:0;" height="155" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_thumb_6.png" width="339" border="0"></a> </p>
<p>11. Choose the variable <strong>name</strong></p>
<p><a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_16.png"><img style="border-right:0;border-top:0;border-left:0;border-bottom:0;" height="93" alt="image" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/SavingkeystrokeswithResharpersLiveTempla_19A1/image_thumb_7.png" width="244" border="0"></a> </p>
<p>12. Close the editor and you're done. <a href="http://hadihariri.com/screencasts/livetemplates.avi">Now watch how it works</a></p>
<p>&nbsp;</p>
<p>Obviously this is just a simple example, but you can see how powerful Live Templates can be.</p>
