---
layout: post
title: Making a habit of giving feedback 
status: published
type: post
published: true
comments: true   
---

How many times have you heard yourself or someone else say 

>"We should give more feedback"

I'm pretty sure it's too many to count. 

<br/>
When it comes to feedback however, we usually think about it in terms of hierarchy; that is, I should receive
feedback from my manager, and hopefully also give them feedback. The reality at times though is that we often
forget to give feedback to our managers. In her book [Radical Candor](https://www.radicalcandor.com/) Kim Scott highlights this point and places emphasis
on how important it is for managers to also be recipients of feedback. However, she also talks about another important
aspect which is peer-to-peer feedback. This is certainly something we don't do as often as we should. 

<br/>

### Well, actually!

The last sentence isn't entirely correct. Sometimes we're actually quite good at giving *feedback* to colleagues, very quickly 
highlighting *issues* we see. We call it constructive criticism, albeit sometimes it's far from constructive, even if we have no ill-intent. In a recent
research by Marcus Buckingham and Ashley Goodall, they wrote about [The Feedback Fallacy](https://hbr.org/2019/03/the-feedback-fallacy) and
how not everything we perceive about feedback is what it seems. 

<br/>
But the article also points out, much like Kim does in her book, that feedback can help. As individuals, we strive to improve. Often times the line
of work we do doesn't provide us with enough data to know whether we're on the right path. Having external folks guide you can be very beneficial. And of course positive reinforcement is also extremely important
as it can help motivate and inspire us to continue to do what we do. 


<br/>

### I'd love to give feedback, I just don't always remember to

Many of us have good intentions and want to give feedback. Yet, we're all busy doing our thing and often de-prioritize this task. On the Developer Advocacy team at JetBrains, we decided to try
and put our feedback where our mouth is (sorry...) and do something about it that wouldn't just end up in words. We decided to make it a rule that every person has to review the work of someone else
during current or past week, and give them feedback on it. In order to do this, we decided to write a small bot for [Space](https://jetbrains.com/space) that takes the list of folks on the team, 
randomly assigns them in pairs and emits a message once a week, indicating the feedback pairs for that week. On a side note, I now have a more difficult job hiring people - we need to make sure we have an even number of people on the team. Otherwise one person ends up with having to give feedback twice! But they'll also receive it twice, so that's great.


### The code...

The code itself is too simple to even bother mentioning, but in case you're wondering, we simply use the HTTP API to get a list of team members, create a set of pairs and emit a message to a feedback channel. And that's scheduled to happen every Monday morning.

```kotlin
class FeedbackBotAlert {

    val spaceClient = SpaceClient()

    @Scheduled(cron = "0 0 8 * * 1")
    @Synchronized fun feedbackAlert() {
        val list = feedbackList()
        sendFeedbackMessage(list, Constants.SPACE_CHATID_FEEDBACK_BOT)
    }

    fun sendFeedbackMessage(feedbackList: Set<Pair<String, String>>, channelId: String = Constants.SPACE_CHATID_FEEDBACK_BOT) {
        spaceClient.sendChatMessage(channelId, "## This is your feedback bot")
        feedbackList.forEach {
            spaceClient.sendChatMessage(channelId, "@${it.first} and @${it.second}, you need to give each other feedback this week")
        }
    }

    fun feedbackList(): Set<Pair<String, String>> {
        val members = spaceClient.getTeamByName(Constants.SPACE_TEAM_DEVELOPER_ADVOCACY)?.memberships
                ?: MembershipCollection()
        return createRandomPairs(members.map { it.member.username })
    }

}
``` 


<br/>
At this point it's too early to tell whether this will be effective and we'll stick to the schedule. For now we've just decided to keep it simple and use the bot as means to randomly pick
people and remind us to give feedback. And that's really all we need when it comes to automation. The next and most important step is for us to make sure we actually deliver
on this task. Hopefully we will. And I'll let y'all know in a few months. Or years... 



