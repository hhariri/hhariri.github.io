---
layout: post
title: Mocks can be your friend, or your worst nightmare
categories: []
tags:
- Design
- Unit Testing
status: publish
type: post
published: true
meta:
  _elasticsearch_indexed_on: '2008-09-12 06:56:54'
---
<p>Take a look at the following test:</p>  <div class="csharpcode-wrapper">   <div class="csharpcode">     <div class="csharpcode-wrapper">       <div class="csharpcode">         <pre class="alt"><span class="lnum">   1:</span> <span class="kwrd">public</span> <span class="kwrd">void</span> EmployeeServicesTest_GetAllEmployeesByCompanyId_When_Employees_Are_Marked_Returns_Non_Marked_Employees()</pre>

        <pre class="alteven"><span class="lnum">   2:</span>        {</pre>

        <pre class="alt"><span class="lnum">   3:</span>            var guid = Guid.NewGuid();</pre>

        <pre class="alteven"><span class="lnum">   4:</span>            var guid2 = Guid.NewGuid();</pre>

        <pre class="alt"><span class="lnum">   5:</span>            var guidComp= Guid.NewGuid();</pre>

        <pre class="alteven"><span class="lnum">   6:</span>&#160; </pre>

        <pre class="alt"><span class="lnum">   7:</span>            MockRepository mocks = <span class="kwrd">new</span> MockRepository();</pre>

        <pre class="alteven"><span class="lnum">   8:</span>&#160; </pre>

        <pre class="alt"><span class="lnum">   9:</span>            IEmployeeRepository mockRepository = (IEmployeeRepository)mocks.StrictMock(<span class="kwrd">typeof</span>(IEmployeeRepository));</pre>

        <pre class="alteven"><span class="lnum">  10:</span>&#160; </pre>

        <pre class="alt"><span class="lnum">  11:</span>&#160; </pre>

        <pre class="alteven"><span class="lnum">  12:</span>            User user = new User();</pre>

        <pre class="alt"><span class="lnum">  13:</span>            user.Id = Guid.NewGuid();</pre>

        <pre class="alteven"><span class="lnum">  14:</span>&#160; </pre>

        <pre class="alt"><span class="lnum">  15:</span>            Employee deletedEmployee = new Employee();</pre>

        <pre class="alteven"><span class="lnum">  16:</span>            deletedEmployee.Id = guid;</pre>

        <pre class="alt"><span class="lnum">  17:</span>            deletedEmployee.DeletedBy = user;</pre>

        <pre class="alteven"><span class="lnum">  18:</span>&#160; </pre>

        <pre class="alt"><span class="lnum">  19:</span>            Employee validEmployee = new Employee();</pre>

        <pre class="alt"><span class="lnum">  20:</span>            validEmployee.Id = guid;</pre>

        <pre class="alt"><span class="lnum">  21:</span>&#160; </pre>

        <pre class="alteven"><span class="lnum">  22:</span>            Expect.Call(mockRepository.GetEmployeesByCompanyId&lt;Employee&gt;(guidComp)).Return(<span class="kwrd">new</span> List&lt;Employee&gt;() { deletedEmployee, validEmployee });</pre>

        <pre class="alt"><span class="lnum">  23:</span>&#160; </pre>

        <pre class="alteven"><span class="lnum">  24:</span>            mocks.ReplayAll();</pre>

        <pre class="alt"><span class="lnum">  25:</span>&#160; </pre>

        <pre class="alteven"><span class="lnum">  26:</span>            var EmployeeServices = <span class="kwrd">new</span> EmployeeServices(mockRepository);</pre>

        <pre class="alt"><span class="lnum">  27:</span>&#160; </pre>

        <pre class="alteven"><span class="lnum">  28:</span>            var testList = EmployeeServices.GetAllEmployeesByCompanyId(guidComp);</pre>

        <pre class="alt"><span class="lnum">  29:</span>&#160; </pre>

        <pre class="alteven"><span class="lnum">  30:</span>            Assert.AreEqual(1, testList.Count);</pre>

        <pre class="alt"><span class="lnum">  31:</span>&#160; </pre>

        <pre class="alteven"><span class="lnum">  32:</span>            mocks.VerifyAll();</pre>

        <pre class="alt"><span class="lnum">  33:</span>        }</pre>
      </div>
    </div>
  </div>
</div>

<p>&#160;</p>

<p>I won't get into the naming conventions since I've covered those in previous blog entries. This test has another problem. It's trying to validate that when you ask for a list of employees, only those that are not marked as deleted are returned. To simulate the data returned, it is making use of a mock repository (RhinoMocks).</p>

<p>Before looking at the issue, let's decide what the purpose of the test is. We want to test that when a system has two employees, one of whom is marked for deletion, a call to <em>GetAllEmployeeesByCompanyId </em>returns only one employee. Therefore the SUT is that method call. </p>

<p>In line 9, a mock of the repository is created, of type StrictMock. This is a particular call of RhinoMocks, but pretty much all mocking frameworks have the same feature. A strict mock indicates that every expected call should be made. Therefore, when on line 32 a call to <em>VerifyAll </em>is made, this test will fail if <em>mockRepository.GetEmployeesByCompanyId </em>has not been called with those exact arguments. In our case, the test passes and all is fine. Or is it?</p>

<p>The problem however if we change the internal functionality of <em>EmployeeServices.GetAllEmployeesByCompanyId</em>. If some reason or other we make a second call to <em>EmployeeRepository, </em>that doesn't change the outcome of the method, this test will fail. </p>

<p>Why is that? The reason isn't so much that we are using <em>StrictMock </em>as opposed to <em>DynamicMock</em>. The problem is that we are trying to test too many things in the same test. In actual fact, in this particular case, only ONE thing should be tested: retrieving one employee out of two. However the introduction of a <em>StrictMock </em>and the <em>VerifyAll</em> call has had the side-effect of introducing an interaction test, something we are not interested in. </p>

<p>Mocks can be great and very powerful. But use them wisely. If you start creating strict mocks (which should only be used for interaction/behavioural testing), then you're just making your tests very brittle. The slightest change in behaviour, even though it's encapsulated inside the method being tested can break your test. This pretty much defeats the whole advantage of unit tests. We create tests to <strong>isolate</strong> functionality and test that functionality in <strong>isolation</strong>. As soon as we tightly couple our tests to a particular implementation, and when the system under test is <strong>not </strong>trying to validate that implementation, the whole thing blows up. In another blog post, I'll re-factor the test to make it much simpler and less volatile. </p>
