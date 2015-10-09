---
layout: post
title: A RunDeck Runner and a TeamCity Plugin Primer
status: published
type: post
published: true
comments: true
---

Earlier this week I pushed a [TeamCity plugin for RunDeck](https://github.com/hhariri/teamcity-rundeck/) to GitHub. If you're not
familiar with RunDeck, it's basically a way for you to schedule and automate commands to be executed on a series of machines you can specify. Each job defines a set of
 steps that can be a simple shell command, a script, a file copy, etc. It's very similar to TeamCity, except its focus is interacting with services and machines as opposed to dealing with projects, builds and tests.
<br/>
<br/>
![RunDeck Config]({{ site.images }}/rundeck-config.png)

# Using the Plugin

The plugin basically adds a new runner type to TeamCity. Once installed you can select it as a Build Step. 
<br/>
<br/>
![RunDeck Step]({{ site.images }}/rundeck-step.png)

<br/>
In terms of configuration parameters:
<br/>


* **RunDeckURL**: Points to the RunDeck server

* **API Token**: RunDeck allows two forms of authentication, username/password and authentication token. Currently the plugin only provides token authentication. In order to use it, you need to [generate a token](http://rundeck.org/docs/api/#token-authentication)
                 from RunDeck and provide this value to the configuration in the runner. 

* **Job Options**: Allows you to specifiy any parameters RunDeck jobs need. The format is the same as those required by RunDeck which is *-param value*
    
* **Node Filter**: RunDeck allows you to filter nodes on which to execute a specific job. These can also be specified as part of the configuration.

<br/>
The rest of the parameters are pretty much self-descriptive.

# A TeamCity Plugin Premier 

TeamCity plugins can basically be written in any language supported on the JVM. While many are written in Java, I've chosen [Kotlin](http://kotlinlang.org). 
TeamCity plugins use Maven as the build tool and you can open the project in IntelliJ IDEA or any other IDE. 
<br/>
<br/>
Like all TeamCity plugins that require work to be performed on the agent, it consists of three modules:

* **rundeck-server**: This contains the code that is shown on the TeamCity server. In essence everything dealing with the configuration page of the runner. The JSP file is where you define the actual 

* **rundeck-agent**: This is where the heavyweight part of the work gets done. It's where the runner invokes the RunDeck API and processes the result. The recommended way to run tasks in TeamCity
 is to isolate them in their own equivalent of what would be a *command line* application. This way, if for whatever reason the task crashes, it doesn't affect the stability of the server. So effectively what
 you're basically doing is coding a command line application. In the case of this plugin, most of the code is located in *RunDeck.kt* and *RunDeckAPI.kt* as the rest is very much boilerplate code. 

* **rundeck-common**: A module where, as its name indicates, you can place shared code.
 
<br/> 
![RunDeck Project]({{ site.images }}/rundeck-project.png)
<br/> 
<br/> 
The TeamCity documentation has more information on how to get started with [plugin development](https://confluence.jetbrains.com/display/TCD9/Developing+TeamCity+Plugins) as well as executing and debugging TeamCity. 

## Contibutions welcome

It seems [Paul](https://twitter.com/stack72) has been running it for the past few days in production successfully, but the code does still need some clean-up and there are a few TODO's left, including

* **Log output**: While there's an option to output log execution to TeamCity Build Log, the functionality has a nice TODO in it.
* **Integration Tests**: Packaging RunDeck to run integration tests as part of the [build](https://teamcity.jetbrains.com/viewType.html?buildTypeId=TeamCityPluginsByJetBrains_TeamcityRunDeck_Build)

So if you're up to it, contributions welcome!


 
