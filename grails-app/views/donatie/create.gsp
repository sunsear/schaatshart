<%@ page import="nl.schaatshart.grails.Donatie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'donatie.label', default: 'Donatie')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-donatie" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${donatieInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${donatieInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
					<div><img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"/></div>
					<div class="fieldcontain  ${hasErrors(bean: donatieInstance, field: 'captcha', 'error')} required">
						<label for="captcha">
							Type bovenstaande letters over:
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="captcha" required="true"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
