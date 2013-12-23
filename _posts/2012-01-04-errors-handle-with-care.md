---
layout: post
title: 'Errors: Handle with care'
categories:
- General
tags:
- Architecture
- Design
status: publish
type: post
published: true
meta:
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1387048816;}
  tagazine-media: a:7:{s:7:"primary";s:0:"";s:6:"images";a:0:{}s:6:"videos";a:0:{}s:11:"image_count";s:1:"0";s:6:"author";s:7:"5078411";s:7:"blog_id";s:8:"11677451";s:9:"mod_stamp";s:19:"2012-01-04
    12:20:30";}
  _elasticsearch_indexed_on: '2012-01-04 12:12:54'
---
Went to renew my driving license this morning, a process the DGT (Traffic Authority in Spain) has made extremely simple now: you just head over to a private clinic, pay quite a bit more than you actually should and have them deal with the bureaucracy.

It was meant to be a 30 minute process and quite straightforward:

1. Ask for customer’s details
2. Run some medical tests
3. Get a temporary driving authorization until your license arrives in the post

I ended up being there about an hour and not getting it renewed.

The real process went something like this:

1. Was asked for all my details at reception and waited as they were typed in.

2. Taken into examination room. Waited 15 minutes until they could start the computer since the fan was acting up. Thankfully the technician (which was actually a Doctor) came in, kicked the box (literally) and it turned on. As he walked out he said:

<em>“these computers are scared of me…”</em>

3. Asked for my details again. When I questioned why I was being prompted for them  a second time, the answer was somewhat expected:

<em>“This computer has nothing to do with the other one. This one runs the DGT program. The other one runs ours. “</em>

Stupid me!

4. Went through some appropriate tests. Again, this was delayed because the second computer failed to boot.
<h3>1st Error handling mistake  – the human</h3>
I waited patiently until my details were submitted to the DGT system. Everything seemed fine until I was suddenly asked:

Operator: <em>“Are you sure you haven’t lost any points on your driving license?”</em>

Me:<em> "Em no. In fact I think I now have 14 as opposed to 12”.</em>

Operator: <em>“Hmm, something is very wrong. It’s giving me <strong>Undetermined Error 611</strong>”</em>

Me: <em>“OK, so what does that mean?”</em>

Operator: <em>“There’s a problem with your driving license. I think….”</em>

Me:<em> “You think or you’re sure?”</em>

Operator:<em> “I can’t know exactly. As it stands I can’t process your renewal. You’ll have to leave this with me. If I don’t call you back today then you’ll need to go to DGT and do it yourself. But don’t worry, we won’t charge you anything”</em>

Now you have to admit, that’s awfully kind of them not to charge me for something they haven’t managed to do.
<h3>2nd error handling mistake – the stupid developer</h3>
Up to now, my customer experience, as a user of this clinic has been somewhat lower than par one could say. I’ve witnessed operator incompetency, lack of care of technical equipment and overall no inspiration of confidence.

This clinic has a ER unit, in-house care, pediatricians and various other specialties. Suffice to say, it does not inspire any confidence in me for me to ever return there, specially when dealing with something serious as health issues. They’ve lost a customer.

The second user experience however comes from the developers that created the system. It was that damn <em><strong>undetermined error 611</strong>. </em>

As a developer, when you see<strong> “Internal Error”</strong>,<strong> “Undetermined Error”</strong> or <strong>“Catastrophic Failure”</strong> you pretty much know what the developer was thinking at the time:

<em>“I don’t give a shit about controlling errors in this scenario. Too many things can go wrong for me to control"</em>

Now I am right in assuming that this error code is only valid for the developer. Otherwise he/she is really stupid to display an error message to the user making them either have to memorize error codes or look them up in some manual.

As such, that leaves one of two options: 611 is just the number they use to define what an undetermined error is (i.e. 500 Internal Server Error) or 611 provides them some valuable insight into the error, which then begs the question of why it’s undetermined.

Whatever the case though, this is yet another UX fail. Not only does it not provide any kind of valuable information to the user, but it also, as is in my case, when faced with a somewhat incompetent user, causes a certain level of concern (WTF is wrong with my license? Has it been revoked?).
<h2></h2>
<h3>Handle with care</h3>
Time and time again I’ve seen applications fail when it comes to handling errors. Most common excuses given when observing bad error management are, that it’s too complicated to know what’s gone wrong. The irony of this is that much of this complexity is caused by the way we design the system, as opposed to the underlying business rules. The only time error handling is too complex to deal with is when a human decision is required. In these scenarios, we need to also deal with the error, but using a different approach.

Providing error codes or ambiguous messages to a user <strong>should never be done</strong>. Anything that interacts with a user, a consumer of your application, should use language the user understands, not something they need to look up. That’s what computers are good for: looking up information.

Now, while writing this post, I got a call from the clinic. The undetermined error ended up being a user error. The operator had asked for my nationality and I had said Spanish. She had entered Spain as my place of birth. DGT had Iran on their records. There was a mismatch. The operator failed in using the system. But the system failed her even more by not handling errors correctly.

Much of this would have not taken place if instead of

<em>“Undetermined error 611”</em>

it would have displayed

<em>“There is a mismatch between the place of birth entered and that on record”</em>

Something as simple as this would have saved me and the clinic time, annoyance and money.
<h2>So never supply error codes?</h2>
When switching to the context of developers, it is fine to provide log details and stack traces. In this context you can provide codes. HTTP does it. It’s useful to automate error handling and machine-to-machine interaction. But in addition to these codes, you still need to provide a valuable message so that a developer can understand where to look, what’s gone wrong.

And if everything does go wrong and there’s no way to handle the situation, consider providing a more re-assuring message to the user, something that doesn’t leave him thinking he’s lost all his points on his driving license:

<em>“It’s OK. You didn’t screw up. We did. We’ll sort it out and get back to you”</em>
