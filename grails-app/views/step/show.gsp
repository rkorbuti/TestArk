
<%@ page import="testark.Step" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'step.label', default: 'Step')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-step" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-step" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list step">
			
				<g:if test="${stepInstance?.userAction}">
				<li class="fieldcontain">
					<span id="userAction-label" class="property-label"><g:message code="step.userAction.label" default="User Action" /></span>
					
						<span class="property-value" aria-labelledby="userAction-label"><g:fieldValue bean="${stepInstance}" field="userAction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stepInstance?.expectedResult}">
				<li class="fieldcontain">
					<span id="expectedResult-label" class="property-label"><g:message code="step.expectedResult.label" default="Expected Result" /></span>
					
						<span class="property-value" aria-labelledby="expectedResult-label"><g:fieldValue bean="${stepInstance}" field="expectedResult"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:stepInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${stepInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
