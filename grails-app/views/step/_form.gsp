<%@ page import="testark.Step" %>



<div class="fieldcontain ${hasErrors(bean: stepInstance, field: 'userAction', 'error')} required">
	<label for="userAction">
		<g:message code="step.userAction.label" default="User Action" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userAction" required="" value="${stepInstance?.userAction}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stepInstance, field: 'expectedResult', 'error')} required">
	<label for="expectedResult">
		<g:message code="step.expectedResult.label" default="Expected Result" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="expectedResult" required="" value="${stepInstance?.expectedResult}"/>

</div>

