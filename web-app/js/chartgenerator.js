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
	
	var YEAR = new Date(2012,0,1, 0, 0, 0, 0).getTime(),
		SECOND = 1000,
		MINUTE = SECOND * 60,
		HOUR = MINUTE * 60,
		DAY = HOUR * 24,
		WEEK = DAY * 7,
		startWeek = 37;


	/**
	 * Calculate the week of year based on millies.
	 * 
	 */
	function getWeek( time ) {

		var sinceThisYear = time - YEAR,
			remains = sinceThisYear%WEEK,
			w = ( sinceThisYear - remains ) / WEEK;

		while ( w > 52 ) {
			w -= 52;
		}
		
		return w;

	}

	/**
	 * Calculate fractional week of year based on millies.
	 * 
	 */
	function getWeekFloat( time ) {

		var sinceThisYear = time - YEAR,
			w = sinceThisYear/WEEK;

		while ( w >= 53 ) {
			w -= 52;
		}
		
		return w;

	}

	/**
	 * Get data for a specific week from the target data of a
	 * chart.
	 * 
	 */
	function getWeekData( week, chart ) {

		for ( var i = 0; i < chart.dataset.length; i++ ) {

			var data = chart.dataset[i];
			if ( data[0] === week ) return data;

		}
		
		return null;

	}

	/**
	 * Generate a measure point based on actual data combined with
	 * the target data of a chart.
	 * 
	 * @param [boolean] rounded Set to true if you want rounded weeks (as opposed to fractional)
	 */
	function getMeasurePoint( data, chart, rounded ) {
		
		console.log( "*** mp", data, chart, rounded );

		var week = getWeek(data[0]);
		
		var setData = getWeekData(week, chart);

		console.log( "*** mp2", week, setData );
		
		if (setData == null) {
			console.log( "Data point '" + JSON.stringify(data) + "' parses to week '" + week + "', which lies outside of the target data!" );
			return null;
		}
		
		var actualWeek = rounded?week:getWeekFloat(data[0]);
		if ( actualWeek < chart.startWeek ) {
			actualWeek += (52 - chart.startWeek);
		} else {
			actualWeek -= chart.startWeek;
		}
	
		return [ ++actualWeek, data[1], setData[1] ];

	}

	/**
	 * Craft a two-dimensional array of measuring points based on the
	 * target data provided at construction time combined with actual data.
	 */
	function craftDataArray( data, chart, rounded ) {

		var out = [['Week',	'Behaald',	'Doel']];
		
		for ( var i = 0; i <  data.length; i++ ) {

			var dataEntry = data[i];
			var mp = getMeasurePoint( dataEntry, chart, rounded );
			if ( mp !== null ) {
				out.push(mp);
			}

		}

		return out;

	}

	/**
	 * Draw a google chart on element with 'id' using a two-dimensional array of
	 * measuring points.
	 * 
	 */
    function drawChart( id, dataset ) {
    	if (!gLoaded) {
    		
    		delayedCharts.push( { id: id, data: dataset } );
    		
    	} else {

    		var data = google.visualization.arrayToDataTable( dataset );

    		var options = {
				legend	: { position	: 'none' },
				vAxis	: { title		: 'Minuten' },
				hAxis	: { title		: 'Trainings Week' }
    		};

    		var chart = new google.visualization.LineChart(document.getElementById( id ));
    		chart.draw(data, options);

    	}
    }

    /**
     * Any requests to draw charts before google is ready are captured and
     * this method will fullfill them when google api is ready to rock.
     * 
     */
    function drawDelayed() {
    	gLoaded = true;
    	var entry = null;
    	
    	while ( entry = delayedCharts.shift() ) {
    		drawChart( entry.id, entry.data );
    	}
    }

    // Get google charting enabled
    google.load("visualization", "1", {packages:["corechart"]});
    // When finished loading check for delayed render requests
    google.setOnLoadCallback(drawDelayed);


    //Constructor of ChartGenerator
    function constructor( dataset, sw ) {
    	
    	if (arguments.length <= 0) {
    		throw "dataset is required at construction!!"
    	}

    	this.dataset	= dataset;
    	
    	if ( typeof sw !== "undefined" ) {
    		this.startWeek = sw;
    	} else {
    		this.startWeek = startWeek;
    	}

    }

    //Public methods of ChartGenerator
    constructor.prototype = {

    	drawChart: function( id, data, rounded ) {
    		drawChart( id, this.craftDataArray( data, rounded ) );
    	},
    	
    	getMeasurePoint: function( data, rounded ) {
    		return getMeasurePoint( data, this, rounded );
    	},
    	
    	craftDataArray: function( data, rounded ) {
    		return craftDataArray( data, this, rounded );
    	}

    }
    
    return constructor;

} )( window, document.body );

