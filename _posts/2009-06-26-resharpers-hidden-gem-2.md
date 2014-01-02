---
layout: post
title: ReSharper's Hidden Gem
categories: []
tags:
- ReSharper
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1380480454;}
  _elasticsearch_indexed_on: '2009-06-26 12:33:00'
comments: true
---
<p>During <a href="http://www.ndc2009.no">NDC</a>, Eugene, from <a href="http://www.jetbrains.com">JetBrains</a>, Technical Lead for ReSharper, showed me some of the cool things that are coming out in the next version, 5.0. But guess what? I'm not going to talk about those now :).</p> <p>What I am going to talk about is an interesting problem he said they were having and something many of us also experience: building solutions.</p> <p>Visual Studio takes some time to build solutions when something changes. The reasons for this are two-fold:</p> <p>&nbsp;</p> <ol> <li><strong>Sequential Builds</strong>. When Visual Studio builds projects, it does them in a sequential order, even if these are completely independent. So let's say you have 20 projects, 15 of which are completely unrelated, Visual Studio will still build these sequentially.  <li><strong>Dependencies</strong>. When you have one project that references another, Visual Studio will always re-build the referencing project if referenced project has changed. </li></ol> <p>&nbsp;</p> <p>And being ReSharper quite a large solution, it was taking them approximately five minutes to build, and they needed a fix for this.</p> <p>One of the not-so-well-known features of MSBuild is the possibility of building projects in parallel. This is a feature that ships with the MSBuild 3.5 Tool set. The following code shows a simple MSBuild project that takes advantage of this feature:</p> <p>&nbsp;</p> <div> <div style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;padding:0;"><pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   1:</span> <span style="color:#0000ff;">&lt;?</span><span style="color:#800000;">xml</span> <span style="color:#ff0000;">version</span><span style="color:#0000ff;">="1.0"</span> <span style="color:#ff0000;">encoding</span><span style="color:#0000ff;">="utf-8"</span>?<span style="color:#0000ff;">&gt;</span></pre>
<p>&nbsp;</p><pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   2:</span> <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">Project</span> <span style="color:#ff0000;">xmlns</span><span style="color:#0000ff;">="http://schemas.microsoft.com/developer/msbuild/2003"</span> <span style="color:#ff0000;">ToolsVersion</span><span style="color:#0000ff;">="3.5"</span><span style="color:#0000ff;">&gt;</span></pre>
<p>&nbsp;</p><pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   3:</span>   <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">ItemGroup</span><span style="color:#0000ff;">&gt;</span></pre>
<p>&nbsp;</p><pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   4:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">ProjectReference</span> <span style="color:#ff0000;">Include</span><span style="color:#0000ff;">="**\*.csproj"</span><span style="color:#0000ff;">/&gt;</span></pre>
<p>&nbsp;</p><pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   5:</span>   <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">ItemGroup</span><span style="color:#0000ff;">&gt;</span></pre>
<p>&nbsp;</p><pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   6:</span>   <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">Target</span> <span style="color:#ff0000;">Name</span><span style="color:#0000ff;">="BuildProjectSet1"</span><span style="color:#0000ff;">&gt;</span></pre>
<p>&nbsp;</p><pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   7:</span>     <span style="color:#0000ff;">&lt;</span><span style="color:#800000;">MSBuild</span> <span style="color:#ff0000;">Projects</span><span style="color:#0000ff;">="@(ProjectReference)"</span> <strong><span style="color:#ff0000;">BuildInParallel</span><span style="color:#0000ff;">="true"</span></strong><span style="color:#0000ff;">/&gt;</span></pre>
<p>&nbsp;</p><pre style="line-height:12pt;background-color:#f4f4f4;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   8:</span>   <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">Target</span><span style="color:#0000ff;">&gt;</span></pre>
<p>&nbsp;</p><pre style="line-height:12pt;background-color:white;width:100%;font-family:consolas,'Courier New',courier,monospace;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;">   9:</span> <span style="color:#0000ff;">&lt;/</span><span style="color:#800000;">Project</span><span style="color:#0000ff;">&gt;</span></pre></div></div>
<p>Combining this with the maxcpucount command line argument, you can specify the number of parallel builds.</p>
<p>Now this solves the first issue, of having independent projects build in parallel as opposed to sequentially, but what about the second problem? Every time you make a change in a project that is referenced in another project, Visual Studio will build the latter, even if none of the public interfaces have changed. Just so we make sure we're on the same page, let's go thru an example:</p>
<p>&nbsp;</p>
<h3>Building NHibernate using Visual Studio</h3>
<p>If you've never built NHibernate before, the first time you need to run the NANT script for it to generate the missing AssemblyInfo.cs files, etc. Once you've done that, you can build it inside Visual Studio.</p>
<p>We first do a BUILD ALL and notice how seven projects get built:</p>
<p>&nbsp;</p>
<p><em>Solution Window</em></p>
<p><a href="http://hhariri.files.wordpress.com/2012/01/1.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="1" border="0" alt="1" src="http://hhariri.files.wordpress.com/2012/01/1_thumb.png" width="411" height="387"></a></p>
<p>&nbsp;</p>
<p><em>Build Output</em></p>
<p><a href="http://hhariri.files.wordpress.com/2012/01/2.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="2" border="0" alt="2" src="http://hhariri.files.wordpress.com/2012/01/2_thumb.png" width="672" height="142"></a></p>
<p>&nbsp;</p>
<p>Now let's make a change to NHibernate.csproj, which is referenced by the majority of the other projects. We'll add a new public class to it:</p>
<p><a href="http://hhariri.files.wordpress.com/2012/01/3.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="3" border="0" alt="3" src="http://hhariri.files.wordpress.com/2012/01/3_thumb.png" width="186" height="136"></a></p>
<p>&nbsp;</p>
<p>If we now Build the entire solution, all projects that reference NHibernate will get re-built. This is expected behaviour since we've made a change to the public interface of the referenced assembly. However, what would happen if we just added a few lines of comments:</p>
<p>&nbsp;</p>
<p><a href="http://hhariri.files.wordpress.com/2012/01/4.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="4" border="0" alt="4" src="http://hhariri.files.wordpress.com/2012/01/4_thumb.png" width="394" height="136"></a></p>
<p>&nbsp;</p>
<p>Despite the public interface not changing, all assemblies that reference NHibernate will be re-built (You can verify this by looking at the timestamps of the assemblies).</p>
<p>&nbsp;</p>
<h3>Verifying what has changed on referenced assemblies</h3>
<p>Thinking about it though, why would we want to have Visual Studio rebuild all referenced assemblies even if there hadn't been a public interface change? Wouldn't it be great if that wouldn't happen? </p>
<p>Here's where ReSharper comes into play. What the guys at JetBrains have done is use the assembly metadata to see if there has been a change in the public interface and ONLY if there has been, build!</p>
<p>This has allowed them to reduce their build time drastically, in some instances dropping down to 30-40 seconds (obviously based on the changes).</p>
<p align="left"><br>What they've done is create their own Solution Builder that examines if the metadata for a referenced assembly has changed. If and only if it has changed, then they build it.</p>
<p align="left"><br>Here's some screenshots of it in action:</p>
<p align="left"><br>&nbsp;</p>
<p align="left"><br><em>Projects building concurrently when possible:</em></p>
<p align="left"><a href="http://hhariri.files.wordpress.com/2012/01/5.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="5" border="0" alt="5" src="http://hhariri.files.wordpress.com/2012/01/5_thumb.png" width="352" height="136"></a> <br></p>
<p align="left"><br>&nbsp;</p>
<p align="left"><a href="http://hhariri.files.wordpress.com/2012/01/6.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="6" border="0" alt="6" src="http://hhariri.files.wordpress.com/2012/01/6_thumb.png" width="349" height="136"></a> <br></p>
<p align="left"><br>&nbsp;<a href="http://hhariri.files.wordpress.com/2012/01/7.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="7" border="0" alt="7" src="http://hhariri.files.wordpress.com/2012/01/7_thumb.png" width="349" height="136"></a></p>
<p align="left"><br><em>Build Results:</em></p>
<p align="left"><a href="http://hhariri.files.wordpress.com/2012/01/8.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="8" border="0" alt="8" src="http://hhariri.files.wordpress.com/2012/01/8_thumb.png" width="271" height="136"></a> <br></p>
<p align="left"><br>&nbsp;</p>
<p align="left"><br>If we run the same changes steps against NHibernate as we've done above, using ReSharper's solution builder, we'll see that if there is no interface change on the referenced assemblies, those assemblies that use them don't get re-built. When in a large solution, this saves substantial amount of time as you can imagine. Combined with parallel builds of independent projects and we're on to a winner!</p>
<p align="left"><br>&nbsp;</p>
<h3>So when can I play with this?</h3>
<p>The bad news is that as it stands right now, there is no guarantee that this feature will make it in 5.0. The good news is that you already have this feature in ReSharper :). However, before we go on, I have to put in a few words (I promised Eugene I would).</p>
<p>&nbsp;</p>
<p align="center"><br><strong><font size="4">DISCLAIMER</font></strong></p>
<p align="center"><br><strong><font size="2">WHAT I'M ABOUT TO SHOW YOU IS NOT OFFICIALLY, UNOFFICIALLY OR EVEN REMOTELY SUPPORTED BY JETBRAINS. THEY WILL NOT BE RESPONSIBLE IF YOUR PROJECT GETS CORRUPTED, DELETED, BUILDS SOMEONE ELSE'S PROJECT REMOTELY OVER THE INTERNET OR EVEN BLOWS UP BY ENABLING THE FOLLOWING FEATURES OF RESHARPER. USE PURELY AT YOUR OWN RISK. YOU, YOURSELF, AND POSSIBLY YOUR MOTHER WILL BE RESPONSIBLE FOR ANYTHING THAT HAPPENS FROM NOW ON. YOU CAN'T HOLD ME RESPONSIBLE EITHER, IN CASE THAT IS NOT BLATANTLY OBVIOUS. OH, BTW, THIS MIGHT NOT ALWAYS WORK.</font></strong></p>
<p align="center"><br><strong><font size="5"></font></strong>&nbsp;</p>
<p>&nbsp;</p>
<p align="left"><br>To enable these features, close down Visual Studio and then start it up with the following command line option: <strong>/ReSharper.Internal</strong>. If all goes well, you'll have some new options enabled in the ReSharper menu (see image below). If you've got something named wrong, you'll get an error. Shut down and try again.</p>
<p align="left"><br>&nbsp;</p>
<p align="left"><a href="http://hhariri.files.wordpress.com/2012/01/9.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="9" border="0" alt="9" src="http://hhariri.files.wordpress.com/2012/01/9_thumb.png" width="153" height="136"></a> <br></p>
<p align="left"><br>&nbsp;</p>
<p align="left"><br>Obviously, apart from the Solution Builder, you'll see a whole slew of new features pop up under the ReSharper menu. I've not played with a lot of them yet, but plan to when I get a chance. </p>
<p align="left"><br>&nbsp;</p>
<h3>Building using the Solution Builder</h3>
<p>When you first open a project after launching Visual Studio with these features enabled, and try and Build, you'll get a screen asking you if you want to use Visual Studio solution builder or ReSharper's Solution Builder. You need to click MSBuild for the latter:</p>
<p>&nbsp;</p>
<p><a href="http://hhariri.files.wordpress.com/2012/01/10.png"><img style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="10" border="0" alt="10" src="http://hhariri.files.wordpress.com/2012/01/10_thumb.png" width="271" height="136"></a></p>
<p>&nbsp;</p>
<p>You can also enable this via the ReSharper options:</p>
<p>&nbsp;</p>
<p><em>Choose Internals under Options:</em></p>
<p><a href="http://hhariri.files.wordpress.com/2012/01/11.png"><img style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="11" border="0" alt="11" src="http://hhariri.files.wordpress.com/2012/01/11_thumb.png" width="250" height="136"></a></p>
<p>&nbsp;</p>
<p><em>Set options as below:</em></p>
<p><a href="http://hhariri.files.wordpress.com/2012/01/12.png"><img style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="12" border="0" alt="12" src="http://hhariri.files.wordpress.com/2012/01/12_thumb.png" width="195" height="136"></a></p>
<p>&nbsp;</p>
<p>Have fun!</p>
<p>&nbsp;</p>
<p>This works for Jetbrains and it works for me, but you use it at your own risk. It might not give you the desired results, but then again, that's why it's not released.</p>
