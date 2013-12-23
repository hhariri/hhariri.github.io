---
layout: post
title: ASP.NET MVC 2 – Preview 1
categories: []
tags:
- ASP.NET MVC
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2009-07-31 04:42:11'
---
<p>It's out. You can download it <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=d34f9eaa-fcbe-4e20-b2fd-a9a03de7d6dd&amp;displaylang=en">from here</a>. Some of the new things it includes ("extracted" from the readme for your convenience):</p> <p>&nbsp;</p> <ul> <li><strong>Areas</strong>: When creating larger ASP.NET MVC applications, you tend to create controllers and views that might be named the same but belong to different aspects of the application (for example you might have a HomeController for Customers and one for Administration). Areas allows you to create "sub-projects" inside your project to group these. </li></ul> <p>&nbsp;</p> <ul> <li><strong>[HttpPost]</strong>: Shortcut for putting [AcceptVerbs(HttpVerbs.Post)] </li></ul> <p>&nbsp;</p> <ul> <li><strong>DataAnnotations: </strong>The default model binder supports DataAnnotations for validation</li></ul> <p>&nbsp;</p> <ul> <li><strong>DefaultValueAttribte: </strong>For types of Int32, DateTime or Guid's you can now specify a default value on the action declaration to better comply with your routing patterns.</li></ul> <p>&nbsp;</p> <ul> <li><strong>Supprot for byte[] and Data.Linq.Binary: </strong>Default Model binder now supports these types. </li></ul> <p>&nbsp;</p> <ul> <li><strong>API improvments</strong></li></ul> <p><strong></strong>&nbsp;</p> <ul> <li><strong>Templated Helpers: </strong>Basically allows you to associate types to certain elements for display/editing. </li></ul> <p><strong></strong>&nbsp;</p> <p>The only breaking changes it seems is introduction of the <em>Area </em>keyword and a signature change in DefaultControllerFactory. That means if you're using a custom controller factory for IoC for example (and if you're not, you should be), you'll need to update your app. </p> <p>There's nothing in the README regarding the inclusion of the strongly-typed helpers from the Futures assembly or any new strongly-typed Html Helpers for element rendering. Not sure if they are included in this assembly or might come in the next preview. </p> <p>Now to go play with it a little...</p>
