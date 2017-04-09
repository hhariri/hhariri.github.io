---
layout: post
title: Kotlin on Raspberry Pi
status: published
type: post
published: true
comments: true
---

Last week [we announced the availability](https://blog.jetbrains.com/kotlin/2017/04/kotlinnative-tech-preview-kotlin-without-a-vm/) of the first technology preview for Kotlin/Native, something that we've been working on since September 2016.

<br/>
With this first preview release, you can now compile Kotlin to run natively on various platforms, including

* Mac OS
* Ubuntu Linux (and other Linux flavours)
* Apple iOS (arm64)
* Raspberry Pi

<br/>
I decided to give it a whirl and see what it takes to get a simple Hello World! running on the Raspberry Pi, which has been sitting in my
desk draw for months now (albeit with a custom-made lego box)

<br/>
![Raspberry Pi 2]({{ site.images }}/kotlin-rpi-1.jpg)
<br/>
<br/>


My device is the Raspberry Pi 2, running the [NOOBS](https://www.raspberrypi.org/downloads/noobs/). No other updates or software installed.


## Setting up the compiler


To target Raspberry Pi, we need to compile our applications on a Linux machine, targeting the Pi. In my case I'm using a VM running Ubuntu Desktop 64bit. 
<br/>

<br/>
First thing is to download the [right compiler distribution](https://github.com/JetBrains/kotlin-native/releases), in our case [Linux](https://github.com/JetBrains/kotlin-native/releases/download/v0.1.0/kotlin-native-linux-0.1.tar.gz). The zip file comes with a command line compiler, Gradle support and some samples.
Given that the compiler requires the JVM, we need to install Java on the Linux distribution. In my case I'm running Java 8. 
 
<br/>
Once we've unzipped the compiler, in the *bin* folder we have access to three script files

* kotlinc
* kotlinc-native
* konanc

The first two are in fact just proxies to *konanc* (codename). 

## Compiling for Linux

To compile the following code to target the platform we have the distribution for (in our case Linux)


<br/>
```kotlin
fun main(args: Array<String>) {
    println("Hello, World!")
}
```

we simply run the following command from the *bin* folder


<br/>
```text
    ./konanc <path_to_source>/sample.kt -o hello 
```

<br/>
we can optionally provide an output filename using the -o tag. Otherwise it defaults to the input filename and extension *kexe*. 


<br/>
![Output on Linux]({{ site.images }}/kotlin-rpi-2.png)
<br/>

## Compiling for Raspberry Pi

Now that we have it working on Linux, let's do the same thing but this time target the Raspberry Pi. For this all we need to do is 
pass the *-target* parameter to the compiler


<br/>
```text
    ./konanc <path_to_source>/sample.kt -target raspberrypi -o hello 
```


<br/>
If we try and run this on Linux, we'll get an expected error 
<br/>


<br/>
![Output on Linux Cross-Compile]({{ site.images }}/kotlin-rpi-3.png)
<br/>
<br/>

Let's transfer this over (in my case using scp) to Raspberry Pi and run it there. 

```text
    scp hello pi@192.168.1.36:~/work
```

<br/>
Once we have it on the device we can simply execute the binary

<br/>
![Output on Raspberry Pi]({{ site.images }}/kotlin-rpi-4.png)
<br/>
<br/>


(you'll notice a small message appear before the output. The team is working on i8n support which will resolve this)

## Next Steps

This is the first preview of Kotlin/Native and there is still a lot to do (big kudos to the team for making the on-boarding experience smooth), but there is already quite a few things you can do with it beyond a simple
Hello World application. Under the *samples* folder you can find numerous examples, including interop with C libraries. 
<br/>

Have a play and give us your feedback! 




