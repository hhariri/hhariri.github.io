---
layout: post
title: 'ASP.NET MVC "Models": The lonesome folder!'
categories: []
tags:
- Architecture
- ASP.NET MVC
- Design
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-05-07 07:14:00'
  twitter_cards_summary_img_size: ''
---
<p>
ASP.NET MVC comes with a Models folder but no Model. Although some see this as a shortcoming, I&#039;m actually delighted that the framework does not bind me to a specific data technology or pattern. If I want to use Active Record I can use Castle&#039;s ActiveRecord. If I want to use a Repository Pattern, I can use NHibernate. If I want to throw something together for a quick prototype, I can use Linq 2 Sql. The advantage of not being tied to a specific data access pattern for me is a win situation.
</p>

<p>
In many a demo, it&#039;s been indicated that the&nbsp; &quot;Models&quot; folder contains your model, whatever that happens to be. It could be your Domain Model, your L2S entities, etc.&nbsp; Now there are obvious reasons that whatever model you have, you wouldn&#039;t include it into your ASP.NET MVC application directly. You would probably reference it as an external assembly, and not directly place it in the Models folder.
</p>

<p>
&nbsp;
</p>

<p>
<a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_2.png"><img style="border:0 none;" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_thumb.png" border="0" alt="image" width="284" height="367" /></a>
</p>

<p>
&nbsp;
</p>

<p>
So this begs the question. Do we just remove the Models folder? Well before I answer that, let me dig into something else.
</p>

<p>
&nbsp;
</p>

<p>
<strong>Binding in ASP.NET MVC</strong>
</p>

<p>
We&#039;ve seen many demos and tutorials where our model is directly passed in into our actions. We would have something along the lines of:
</p>

<p>
&nbsp;
</p>

<p>
<a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_6.png"><img style="border:0 none;" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_thumb_2.png" border="0" alt="image" width="484" height="291" /></a>
</p>

<p>
&nbsp;
</p>

<p>
ASP.NET MVC&#039;s binding is pretty powerful. It can reflect on the properties of your class (even if they contain complex types) and match these up to the properties that come through over the wire, via the request POST. As long as you name the properties the same, it works like a charm. One issue that this introduces, as outlined by <a href="http://www.codethinked.com/post/2009/01/08/ASPNET-MVC-Think-Before-You-Bind.aspx">Justine in his post</a>, as well as many others, is that the binding can come back to bite you. If you Customer entity has a field that you don&#039;t want the user to be able to update, you&#039;ll need to explicitly specify this by using attributes:
</p>

<p>
&nbsp;
</p>

<p>
<a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_8.png"><img style="border:0 none;" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_thumb_3.png" border="0" alt="image" width="495" height="82" /></a>
</p>

<p>
&nbsp;
</p>

<p>
However, as simple as it might seem, it&#039;s error prone and violates DRY. Alternatives to this approach include creating custom model binders or using interfaces to specify the properties that you want to be databound. But let&#039;s hold that thought for a moment.
</p>

<p>
&nbsp;
</p>

<p>
<strong>A typical update scenario for a typical entity</strong>
</p>

<p>
The following screen has a sample form to fill in the details for a customer
</p>

<p>
<a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_10.png"><img style="border:0 none;" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_thumb_4.png" border="0" alt="image" width="474" height="302" /></a>
</p>

<p>
It&#039;s pretty standard. A bunch of fields and some dropdowns. But how is the dropdown values set? You could set them in the controller action just before displaying the view, using ViewData:
</p>

<p>
&nbsp;
</p>

<p>
<a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_12.png"><img style="border:0 none;" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_thumb_5.png" border="0" alt="image" width="636" height="94" /></a>
</p>

<p>
&nbsp;
</p>

<p>
Now I don&#039;t know about you, but for me, using ViewData is a smell. If we don&#039;t use ViewData to pass information about our model, why should we be using it to pass information that our model indirectly consumes? And of course, being a dictionary that it is, it&#039;s prone to errors.
</p>

<p>
&nbsp;
</p>

<p>
<strong>One plus one makes habitants for Models folder</strong>
</p>

<p>
We have two problems to solve:
</p>

<ul>

	<li>Binding to only those properties that we need</li>
	<li>Passing additional information to our views in a strongly-typed manner</li>
</ul>

<p>
Well this just cries out for a new class to encapsulate this information, i.e. a view model. Instead of binding directly to entities, you can bind to a new class that exposes only the information that is allowed to be updated. You can also use this class to provide other information required for a particular view. In the case of Customer, we could end up with something along the lines of:
</p>

<p>
&nbsp;
</p>

<p>
<a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_18.png"><img style="border:0 none;" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_thumb_8.png" border="0" alt="image" width="753" height="313" /></a>
</p>

<p>
&nbsp;
</p>

<p>
In this case, we are using CustomerData as a DTO to hold the customer data (Name, Email, etc.) and the CustomerCreateViewModel as the View Model to hold other pertinent information for that particular view, for instance a list of countries. The action would now pass in this model as opposed to Customer:
</p>

<p>
&nbsp;
</p>

<p>
<a href="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_20.png"><img style="border:0 none;" src="http://hadihariri.com/blogengine/image.axd?picture=WindowsLiveWriter/ASP.NETMVCTheModelisViewModels_76CC/image_thumb_9.png" border="0" alt="image" width="744" height="143" /></a>
</p>

<p>
&nbsp;
</p>

<p>
We now have a strongly-typed model to represent all the information we need for a particular view, and since it pertains to the current MVC application and specific Views, what better place to hold this than the Models folder.&nbsp; Obviously based on your needs, you could provide a flattened version of this ViewModel but it does provide a cleaner approach to separate the actual DTO of your entity from the surrounding <em>auxiliary</em> requirements for a view.
</p>

<p>
Note: you need to make sure that you always provide a default parameter-less constructor for your view models since the framework requires this on binding.
</p>

<p>
&nbsp;
</p>

<p>
<strong>Summary</strong>
</p>

<p>
By using strongly-typed views, you get the best of all worlds. You are able to make use of the binding provided by the MVC framework and it also provides a clean approach to providing specific data for views. And if that still doesn&#039;t cut it for you, think that you&#039;re making a home out of your Models folder!
</p>
