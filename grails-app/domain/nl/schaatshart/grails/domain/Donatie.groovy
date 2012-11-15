package nl.schaatshart.grails.domain

class Donatie {
	String name;
	boolean anoniem = false;
	Double amountPerKm;
	String email;
	String phone;
	static constraints = {
		name blank:false, minSize:4
		anoniem()
		amountPerKm min:0.1D
		email email:true, blank:false
		phone nullable: true
	}
}
