/**
 * A wrapper for creating a nice chart based on target data and actual data.
 * Why the wrapper? Well, to make it less of a hassle to input the changing
 * actual data-set.
 * With this wrapper you create a target data-set and render actual charts with
 * a subset of results.
 * 
 * var chart = new ChartGenerator( 32, 40, 121, 142 );
 * chart.drawChart( "chart_div", 35, 38, [ 75, 70, 92, 100 ] );
 * 
 */
var ChartGenerator = ( function( w, b ) {
	
	var gLoaded			= false,
		delayedCharts	= new Array();

	/**
	 * Calculate the weeks and targets.
	 * 
	 * @param	[int]	ws	Starting week
	 * @param	[int]	we	Ending week
	 * @param	[int]	ts	Starting target value
	 * @param	[int]	te	Ending target value
	 */
	function calculate( ws, we, ts, te, chart ) {

		var t	= we - ws,
			inc	= ( te - ts ) / t;

		for ( var i = 0; i <= t; i++ ) {

			chart.weeks.push( ws + i );
			chart.targets.push( ts + Math.round( i * inc ) );

		}

	}

	/**
	 * Return the base set of information.
	 * 
	 */
	function getBaseSet( chart ) {

		return {

			w: chart.weeks,
			t: chart.targets,
			r: chart.results

		};

	}

	/**
	 * Craft the data set based on start and end week as
	 * well as a set of data-points.
	 * 
	 * @param [int] s Starting week
	 * @param [int] e Ending week
	 * @param [Array] d data points for building the Array
	 */
	function craftDataArray( s, e, d, chart ) {

		var data = [['Week',	'Behaald',	'Doel']];

		var offset = 0;
		
		for ( offset = 0; offset < chart.weeks.length && s > chart.weeks[offset]; offset++ );
		
		for ( var i = offset; i < chart.weeks.length && chart.weeks[i] <= e; i++) {

			var entry = [chart.weeks[i], d[i - offset], chart.targets[i]];
			data.push( entry );

		}

		return data;

	}

    function drawChart( id, dataset ) {
    	if (!gLoaded) {
    		
    		delayedCharts.push( { id: id, data: dataset } );
    		
    	} else {
    		var dt = document.getElementById("chart_detailed");
    		if (dt) {
    			dt.className = " details inProgress";
    		}

    		var data = google.visualization.arrayToDataTable( dataset );

    		var options = {
				legend	: { position	: 'none' },
				vAxis	: { title		: 'Minuten' },
				hAxis	: { title		: 'Week' }
    		};

    		var chart = new google.visualization.LineChart(document.getElementById( id ));
    		chart.draw(data, options);

    		if (dt) {
    			dt.className = " details";
    		}
    	}
    }
    
    function drawDelayed() {
    	gLoaded = true;
    	var entry = null;
    	
    	while ( entry = delayedCharts.shift() ) {
    		drawChart( entry.id, entry.data );
    	}
    }

    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawDelayed);
    
    function constructor( ws, we, ts, te ) {

    	this.weeks		= new Array(),
    	this.targets	= new Array(),
    	this.results	= new Array();
    	
    	this.baseSet	= calculate( ws, we, ts, te, this );

    }

    constructor.prototype = {

    	reCalculate: function( ws, we, ts, te ) {
    		return calculate( ws, we, ts, te, this );
    	},

    	drawChart: function( id, s, e, d ) {
    		drawChart( id, this.craftDataArray( s, e, d ) );
    	},
    	
    	craftDataArray: function( s, e, d ) {
    		return craftDataArray( s, e, d, this );
    	},
    	
    	getBaseSet: function() {
    		return getBaseSet( this );
    	}

    }
    
    return constructor;

} )( window, document.body );

