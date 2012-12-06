<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Voortgang</title>
	</head>
	<body>
		<!-- 
		<a target="_top" href="http://www.schaatshart.nl/donatieLijst">
		<progress class="voortgang" max="${donatieStatus.doel}" value="${donatieStatus.verwachteDonaties}"></progress>
		</a><br/>
		<strong class="voortgang"><a target="_top" href="http://www.schaatshart.nl/donatieLijst"><g:formatNumber number="${donatieStatus.verwachteDonaties}" currencySymbol="&euro;" type="currency"/></a>/<g:formatNumber number="${donatieStatus.doel}" currencySymbol="&euro;" type="currency"/></strong><br/>
		
		<a class="steun" target="_top" href="http://www.schaatshart.nl/doneer">Steun mij!</a>
		 -->
		<a class="donatieMeter" target="_top" href="http://www.schaatshart.nl/doneer/donatielijst">
			<strong class="meter" style="height:${donatieStatus.verwachteDonaties/donatieStatus.doel*100}%"></strong>
		</a>
		<div class="voortgang">
			<em><g:formatNumber number="${donatieStatus.verwachteDonaties/donatieStatus.doel}" maxFractionDigits="2" minFractionDigits="2" type="percent"/></em>
			<strong class="details">
				<a target="_top" href="http://www.schaatshart.nl/doneer/donatielijst">
					<g:formatNumber number="${donatieStatus.verwachteDonaties}" currencySymbol="&euro;" type="currency"/> /
				</a>
				<g:formatNumber number="${donatieStatus.doel}" currencySymbol="&euro;" type="currency"/>
			</strong>
			<a class="steun" target="_top" href="http://www.schaatshart.nl/doneer">Steun mij!</a>
		</div>
	</body>
</html>