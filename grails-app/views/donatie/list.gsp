
<%@ page import="nl.schaatshart.grails.Donatie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'donatie.label', default: 'Donatie')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-donatie" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<p><a href="http://schaatsenvoorhartekind2013.alvarum.net/martinvandijken#donations">Totale donaties op Alvarum: ${donatiesOpAlvarum}</a></p>
			<h2>Donaties gebaseerd op prestatie</h2>
			<p>Totale donaties gebaseerd op prestatie: ${donatieInstanceSum}</a></p>
			<g:render template="donatie_table"/>
			<div class="pagination">
				<g:paginate total="${donatieInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
