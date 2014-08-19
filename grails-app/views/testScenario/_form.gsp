<%@ page import="testark.TestScenario" %>



<div class="fieldcontain ${hasErrors(bean: testScenarioInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="testScenario.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${testScenarioInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: testScenarioInstance, field: 'story', 'error')} ">
	<label for="story">
		<g:message code="testScenario.story.label" default="Story" />
		
	</label>
	<g:textField name="story" value="${testScenarioInstance?.story}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: testScenarioInstance, field: 'steps', 'error')} ">
	<label for="steps">
		<g:message code="testScenario.steps.label" default="Steps" />
		
	</label>
	<g:select name="steps" from="${testark.Step.list()}" multiple="multiple" optionKey="id" size="5" value="${testScenarioInstance?.steps*.id}" class="many-to-many"/>

</div>

