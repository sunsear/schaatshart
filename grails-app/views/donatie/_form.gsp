<%@ page import="nl.schaatshart.grails.Donatie" %>
<div class="fieldcontain ${hasErrors(bean: donatieInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="donatie.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${donatieInstance?.name}"/>
	<div>
	<g:checkBox name="anoniem" class="anoniem" value="${donatieInstance?.anoniem}" />
	<label for="anoniem" class="anoniem">
		<g:message code="donatie.anoniem.label" default="Anoniem" />
	</label>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: donatieInstance, field: 'amountPerKm', 'error')} required">
	<label for="amountPerKm">
		<g:message code="donatie.amountPerKm.label" default="Amount Per Km" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amountPerKm" value="${fieldValue(bean: donatieInstance, field: 'amountPerKm')}" required="" onkeyup="document.getElementById('total').innerHTML=this.value;"/>
	<p class="explanation">Je totale donatie als ik 100km schaats komt dan op  &euro; <span id="total">${donatieInstance.amountPerKm}</span>
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

<div class="fieldcontain ${hasErrors(bean: donatieInstance, field: 'aanmoediging', 'error')} ">
	<label for="aanmoediging">
		<g:message code="donatie.aanmoediging.label" default="Aanmoedigingsbericht voor Martin" />
		
	</label>
	<g:textField name="aanmoediging" value="${donatieInstance?.aanmoediging}"/>
</div>

<div class="fieldcontain url ${hasErrors(bean: donatieInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="donatie.phone.url" default="Url" />
		
	</label>
	<g:textField name="url" value="${donatieInstance?.url}"/>
</div>
