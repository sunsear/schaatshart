<%@ page import="nl.schaatshart.grails.Donatie" %>
<div class="fieldcontain ${hasErrors(bean: donatieInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="donatie.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${donatieInstance?.name}"/>
</div>
<div>
	<g:checkBox name="anoniem" class="anoniem" value="${donatieInstance?.anoniem}" />
	<label for="anoniem" class="anoniem">
		<g:message code="donatie.anoniem.label" default="Anoniem" />
	</label>
</div>

<div class="fieldcontain ${hasErrors(bean: donatieInstance, field: 'amountPerKm', 'error')} required">
	<label for="amountPerKm">
		<g:message code="donatie.amountPerKm.label" default="Amount Per Km" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amountPerKm" value="${fieldValue(bean: donatieInstance, field: 'amountPerKm')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: donatieInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="donatie.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${donatieInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: donatieInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="donatie.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${donatieInstance?.phone}"/>
</div>

