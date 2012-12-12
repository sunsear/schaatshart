<%@ page import="nl.schaatshart.grails.Donatie" %>
			<table class="donaties" cellpadding="0" cellspacing="0">
				<colgroup>
					<col class="naam"></col>
					<col class="aanmoediging"></col>
					<col class="donatie"></col>
				</colgroup>
				<thead>
				<tr>
					<g:sortableColumn property="name" title="${message(code: 'donatie.name.label', default: 'Naam')}" />
					<g:sortableColumn property="aanmoediging" title="${message(code: 'donatie.aanmoediging.header', default: 'Naam')}" />
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
						<g:fieldValue bean="${donatieInstance}" field="aanmoediging"/>
					</td>
					<td>
						<g:message code="donatie.per.km" args="${[donatieInstance.amountPerKm]}"/>
					</td>
					</tr>
				</g:each>
				</tbody>
			</table>			
