package nl.schaatshart.grails

class Donatie {
	String name;
	boolean anoniem = false;
	int amountPerKm = 10;
	String email;
	String phone;
	static constraints = {
		name blank:false, minSize:4
		anoniem()
		amountPerKm min:1
		email email:true, blank:false
		phone nullable: true
	}
}
