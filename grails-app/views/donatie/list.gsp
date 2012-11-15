
<%@ page import="nl.schaatshart.grails.Donatie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'donatie.label', default: 'Donatie')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-donatie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-donatie" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'donatie.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="anoniem" title="${message(code: 'donatie.anoniem.label', default: 'Anoniem')}" />
					
						<g:sortableColumn property="amountPerKm" title="${message(code: 'donatie.amountPerKm.label', default: 'Amount Per Km')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'donatie.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'donatie.phone.label', default: 'Phone')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${donatieInstanceList}" status="i" var="donatieInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${donatieInstance.id}">${fieldValue(bean: donatieInstance, field: "name")}</g:link></td>
					
						<td><g:formatBoolean boolean="${donatieInstance.anoniem}" /></td>
					
						<td>${fieldValue(bean: donatieInstance, field: "amountPerKm")}</td>
					
						<td>${fieldValue(bean: donatieInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: donatieInstance, field: "phone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${donatieInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
