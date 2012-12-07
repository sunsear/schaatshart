<!DOCTYPE HTML>
<html>
<head>

    <script src="https://www.google.com/jsapi"></script>
    <script src="js/chartgenerator.js"></script>
    <script>
    	(function() {

    		var chart = new ChartGenerator( 25, 50, 121, 142 );
			chart.drawChart( "chart_div", 35, 38, [ 75, 70, 92, 100 ] );
			chart.drawChart( "chart_div2", 25, 50, [ 35, 38, 36, 40, 42, 45, 47, 49, 50, 52, 55, 56, 63, 75, 70, 92, 100, 115, 145 ] );

    	})();
    </script>
	<style>
		.progressChart {
			float: right;
			position: relative;
			text-align: center;
		}
		
		.details {
			position: absolute;
			top: 0;
			right: 0;
			display: none;
		}
		
		.closeDetails {
			position: absolute;
			top: 0;
			right: 0;
			z-index: 5;
		}
		
		.details:target {
			display: block;
		}
		.details.inProgress {
			visibility: hidden;
			display: block;
		}
		.chart {
			z-index: 1;
		}
	</style>

</head>

<body>
	[<g:each in="${activities}" status="i" var="activity">
		[${activity.start_seconds},${activity.duration}]<g:if test="${i<activities.size()-1}">,</g:if>
	</g:each>]
	<div class="progressChart">

	    <div id="chart_div" class="chart" style="width: 240px; height: 150px;"></div>
	    <a href="#chart_detailed">Complete schema</a>
	    
	    <div class="details" id="chart_detailed">
		    <a class="closeDetails" href="#top">sluiten</a>
	    	<div id="chart_div2" class="chart" style="width: 700px; height: 350px;"></div>
		</div>
		
    </div>
</body>
</html>
