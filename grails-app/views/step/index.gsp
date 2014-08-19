
<%@ page import="testark.Step" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'step.label', default: 'Step')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-step" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-step" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="userAction" title="${message(code: 'step.userAction.label', default: 'User Action')}" />
					
						<g:sortableColumn property="expectedResult" title="${message(code: 'step.expectedResult.label', default: 'Expected Result')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stepInstanceList}" status="i" var="stepInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stepInstance.id}">${fieldValue(bean: stepInstance, field: "userAction")}</g:link></td>
					
						<td>${fieldValue(bean: stepInstance, field: "expectedResult")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stepInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
