
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
			<p><a href="http://schaatsenvoorhartekind2013.alvarum.net/martinvandijken#donations">Totale donaties op Alvarum: &euro; ${donatiesOpAlvarum}</a></p>
			<h2>Donaties gebaseerd op prestatie</h2>
			<p>Totale donaties gebaseerd op prestatie: &euro; ${donatieInstanceSum}</a></p>
			<g:render template="donatie_table"/>
			<div class="pagination">
				<g:paginate total="${donatieInstanceTotal}" />
			</div>
			<h2>Donaties direct overgemaakt aan Stichting Hartekind</h2>
			<p>Totale donaties direct overgemaakt: &euro; 250</a></p>
			<table class="donaties" cellpadding="0" cellspacing="0">
				<colgroup>
					<col class="naam"></col>
					<col class="aanmoediging"></col>
					<col class="donatie"></col>
				</colgroup>
				<thead>
				<tr>
					<th>${message(code: 'donatie.name.label', default: 'Naam')}</th>
					<th>${message(code: 'donatie.aanmoediging.header', default: 'Naam')}</th>
					<th>${message(code: 'donatie.label')}"</th>
				</tr>
				</thead>
				<tbody>
					<tr class="odd">
					<td>
						RIGD-Loxia
					</td>
					<td>
						Goede voorbereiding voor en succesvolle tocht. 
					</td>
					<td>
						&euro; 250
					</td>
					</tr>
				</tbody>
			</table>			
		</div>
	</body>
</html>
