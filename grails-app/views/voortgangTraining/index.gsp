<!DOCTYPE HTML>
<html>
<head>

    <script src="https://www.google.com/jsapi"></script>
    <script src="js/chartgenerator.js"></script>
	<style>
		.progressChart {
			float: right;
			position: relative;
			text-align: center;
		}
		
		.chart {
			z-index: 1;
		}
	</style>
    <script>
    	(function() {

    		var thisYear = new Date(2012,0,1, 0, 0, 0, 0).getTime(),
	    		second = 1000,
	    		minute = second * 60,
	    		hour = minute * 60,
	    		day = hour * 24,
	    		week = day * 7;
    	
	    	var data = [<g:each in="${recentWeeks.recentWeeks}" status="i" var="week">
	    	            [ thisYear + ${week} * week + day, ${recentWeeks.allDurations.get(week)}]<g:if test="${i<recentWeeks.recentWeeks.size()-1}">,</g:if>
			</g:each>];
    		var chart = new ChartGenerator( [
    		              	               [37, 80 * 60],
    		            	               [38, 90 * 60],
    		            	               [39, 100 * 60],
    		            	               [40, 110 * 60],
    		            	               [41, 120 * 60],
    		            	               [42, 130 * 60],
    		            	               [43, 140 * 60],
    		            	               [44, 150 * 60],
    		            	               [45, 160 * 60],
    		            	               [46, 170 * 60],
    		            	               [47, 180 * 60],
    		            	               [48, 180 * 60],
    		            	               [49, 180 * 60],
    		            	               [50, 210 * 60],
    		            	               [51, 240 * 60],
    		            	               [52, 270 * 60],
    		            	               [01, 300 * 60],
    		            	               [02, 300 * 60],
    		            	               [03, 120 * 60],
    		            	               [04, 90 * 60]
    		            	] );
 			chart.drawChart( "chart_div", data, true );
			chart.drawChart( "chart_div2", [<g:each in="${activities}" status="i" var="activity">
				[${activity.start_seconds},${activity.duration}]<g:if test="${i<activities.size()-1}">,</g:if>
			</g:each>]);
    	})();
	</script>
</head>

<body>
	<div class="progressChart">
	    <div id="chart_div" class="chart" style="width: 140px; height: 150px;"></div>
	    
	   	<div id="chart_div2" class="chart" style="width: 700px; height: 350px;"></div>
    </div>
</body>
</html>
