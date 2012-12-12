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
			 
			<h1>Hmm, dat is jammer</h1>
			<p>Volgens mijn software werd dit formulier ingevuld door een robot op het internet. Als dit niet klopt en je graag een donatie wilt aanmelden, neem svp even contact met me op via <a href="mailto:info@schaatshart.nl">info@schaatshart.nl</a></p>
		</div>
	</body>
</html>
