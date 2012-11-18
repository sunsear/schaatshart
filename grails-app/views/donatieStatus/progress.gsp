<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Voortgang</title>
	</head>
	<body>
		<progress max="${donatieStatus.doel}" value="${donatieStatus.verwachteDonaties}"></progress><br/>
		<strong><g:formatNumber number="${donatieStatus.verwachteDonaties}" currencySymbol="&euro;" type="currency"/>/<g:formatNumber number="${donatieStatus.doel}" currencySymbol="&euro;" type="currency"/></strong><br/>
		
		<a class="steun" target="_top" href="http://www.schaatshart.nl/doneer">Steun mij!</a>
	</body>
</html>