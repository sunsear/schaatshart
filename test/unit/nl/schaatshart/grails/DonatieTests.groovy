package nl.schaatshart.grails;

import static org.junit.Assert.*
import grails.test.mixin.Mock

import org.junit.Test

@Mock(Donatie)
class DonatieTests {
	@Test
	public void overallAmountSums2Donations(){
		Donatie donatie = createDonatie()
		donatie.save(flush:true)
		def donatie2 = createDonatie()
		donatie2.save(flush:true)
		assert Donatie.getOverallAmount() == 2000
	}
	@Test
	public void overallAmountGeeft0ZonderDonaties(){
		assert Donatie.getOverallAmount() == 0
	}

	static Donatie createDonatie(){
		Donatie donatie = new Donatie()
		donatie.name="Martin"
		donatie.email="m@nu.nl"
		donatie.amountPerKm=1000
		return donatie
	}
}
