
<%@ page import="testark.TestScenario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testScenario.label', default: 'TestScenario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-testScenario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-testScenario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'testScenario.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="story" title="${message(code: 'testScenario.story.label', default: 'Story')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${testScenarioInstanceList}" status="i" var="testScenarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${testScenarioInstance.id}">${fieldValue(bean: testScenarioInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: testScenarioInstance, field: "story")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${testScenarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
