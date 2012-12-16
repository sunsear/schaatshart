package nl.schaatshart.grails

class Donatie {
	String name;
	boolean anoniem = false;
	int amountPerKm = 10;
	String email;
	String phone;
	String aanmoediging;
	String url;

	static constraints = {
		name blank:false, minSize:4
		anoniem()
		amountPerKm min:1
		email email:true, blank:false
		aanmoediging maxSize:255, nullable: true
		phone nullable: true
		url  nullable: true
	}

	static def getOverallAmount() {
		def c = Donatie.createCriteria()
		def amount = c.get { projections { sum "amountPerKm"
			} }
		return amount==null?0:amount
	}
}
