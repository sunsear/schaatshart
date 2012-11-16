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
				<tr>
					<th><g:message code="donatie.name.label" default="Naam" /></th>
					<th><g:message code="donatie.label" default="Donatie" /></th>
				</tr>
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
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${donatieInstance?.id}" />
					<g:link class="edit" action="edit" id="${donatieInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
