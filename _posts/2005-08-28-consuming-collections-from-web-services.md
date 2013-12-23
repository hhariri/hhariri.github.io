---
layout: post
title: Consuming Collections from Web Services
categories: []
tags: []
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2005-08-28 20:34:00'
---
<p>Consuming Collections from Web Services is not something new. However, if you have ever tried to bind the collection to a DataGrid for example, you might be surprised why your data does not appear, and instead you get a nice error saying that a field named &quot;xxxx&quot; was not found. </p>  <p>The reason for this is that the wsdl.exe tool that creates a proxy class for your web service publishes the public properties you had created in your class as public fields and not properties. For Collections to be used directly in databound controls, the fields have to be public properties. So what to do? Well instead of explaining the problem from scratch; take a look at this <a href="http://www.microsoft.com/belux/nl/msdn/community/columns/jtielens/webservicewrapper.mspx">article by Jan Tielens</a>. It gives a very concise explanation of the problem and provide an elegant solution. There is only one catch: it will not work from an ASP.NET application. That is because the class wrapper depends on a call to GetEntryAssembly. This call looks under the current App Domain for the assembly, and the ASP.NET application is not in there. One solution is to pass in the calling assembly when calling the Web Service Wrapper. I&#039;ve been in contact with Jan and he&#039;s kindly given permission for me to make modifications to his wrapper and post it. As soon as I get a chance I will do that. Until then.....</p>
