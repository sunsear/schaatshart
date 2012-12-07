package nl.schaatshart.grails



import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(RunkeeperActivitiesRetrieverService)
class RunkeeperActivitiesRetrieverServiceTests {
	void testGetActivities() {
		println new RunkeeperActivitiesRetrieverService().getActivities();
	}
}