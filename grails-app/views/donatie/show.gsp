
<%@ page import="nl.schaatshart.grails.Donatie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'donatie.label', default: 'Donatie')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-donatie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-donatie" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list donatie">
			
				<g:if test="${donatieInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="donatie.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${donatieInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${donatieInstance?.anoniem}">
				<li class="fieldcontain">
					<span id="anoniem-label" class="property-label"><g:message code="donatie.anoniem.label" default="Anoniem" /></span>
					
						<span class="property-value" aria-labelledby="anoniem-label"><g:formatBoolean boolean="${donatieInstance?.anoniem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${donatieInstance?.amountPerKm}">
				<li class="fieldcontain">
					<span id="amountPerKm-label" class="property-label"><g:message code="donatie.amountPerKm.label" default="Amount Per Km" /></span>
					
						<span class="property-value" aria-labelledby="amountPerKm-label"><g:fieldValue bean="${donatieInstance}" field="amountPerKm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${donatieInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="donatie.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${donatieInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${donatieInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="donatie.phone.label" default="Phone" /></span>
					
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
