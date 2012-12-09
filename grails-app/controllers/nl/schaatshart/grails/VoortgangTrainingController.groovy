package nl.schaatshart.grails

class VoortgangTrainingController {
	def runkeeperActivitiesRetrieverService
	def index() {
		[activities: runkeeperActivitiesRetrieverService.getActivities(), recentWeeks:runkeeperActivitiesRetrieverService.getFiveRecentWeeks()]
	}
}
