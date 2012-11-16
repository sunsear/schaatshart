<%@ page import="nl.schaatshart.grails.Donatie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'donatie.label', default: 'Donatie')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-donatie" class="content scaffold-show" role="main">
			 
			<h1>Bedankt voor je donatie!</h1>
			<p>Na 25 januari neem ik contact met je op om het overmaken van de donatie te regelen. Je donatie wordt als volgt op de site vermeld:</p>
			<table class="donaties" cellpadding="0" cellspacing="0">
				<colgroup>
					<col class="naam"></col>
					<col class="donatie"></col>
				</colgroup>
				<thead>
				<tr>
					<th><g:message code="donatie.name.label" default="Naam" /></th>
					<th><g:message code="donatie.label" default="Donatie" /></th>
				</tr>
				</thead>
				<tbody>
				<tr>
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
				</tbody>
			</table>			
			
			<p>De volgende gegevens worden <em>NIET</em> op de site vermeld, maar worden gebruikt om de uiteindelijke afrekening te kunnen doen.</p>

			<ol class="property-list donatie">
				<g:if test="${donatieInstance?.anoniem}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="donatie.name.label" default="Name" />:</span>
					<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${donatieInstance}" field="name"/></span>
				</li>
				</g:if>
			
				<g:if test="${donatieInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="donatie.email.label" default="Email" />:</span>
					<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${donatieInstance}" field="email"/></span>
				</li>
				</g:if>
			
				<g:if test="${donatieInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="donatie.phone.label" default="Phone" />:</span>
					<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${donatieInstance}" field="phone"/></span>
				</li>
				</g:if>
			</ol>
			
			<p>Mocht je een fout gemaakt hebben bij het invoeren van deze gegevens, neem svp even contact met me op via <a href="mailto:info@schaatshart.nl">email</a>.
		</div>
	</body>
</html>
