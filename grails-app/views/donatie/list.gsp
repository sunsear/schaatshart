
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
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<p>Helaas worden donaties op twee plekken geregistreerd. Directe donaties worden bij Alvarum aangenomen. 
			Zij hebben de methodes om geld in ontvangst te nemen en dat door te sturen naar Stichting Hartekind.
			Helaas is het bij hen niet mogelijk om donaties te registreren die afhankelijk zijn van het aantal geschaatste
			kilometers. Deze donaties staan dus in de lijst hieronder.
			</p>
			<p><a href="http://schaatsenvoorhartekind2013.alvarum.net/martinvandijken#donations">Totale donaties op Alvarum: ${donatiesOpAlvarum}</a></p>
			<h2>Donaties gebaseerd op prestatie</h2>
			<p>Totale donaties gebaseerd op prestatie: ${donatieInstanceSum}</a></p>
			<table class="donaties" cellpadding="0" cellspacing="0">
				<colgroup>
					<col class="naam"></col>
					<col class="donatie"></col>
				</colgroup>
				<thead>
				<tr>
					<g:sortableColumn property="name" title="${message(code: 'donatie.name.label', default: 'Naam')}" />
					<g:sortableColumn property="amountPerKm" title="${message(code: 'donatie.label')}" />
				</tr>
				</thead>
				<tbody>
				<g:each in="${donatieInstanceList}" status="i" var="donatieInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
						<g:if test="${!donatieInstance.anoniem}">
							<g:fieldValue bean="${donatieInstance}" field="name"/>
						</g:if>
						<g:if test="${donatieInstance.anoniem}">
							Anoniem
						</g:if>
					</td>
					<td>
						<g:message code="donatie.per.km" args="${[donatieInstance.amountPerKm]}"/>
					</td>
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
