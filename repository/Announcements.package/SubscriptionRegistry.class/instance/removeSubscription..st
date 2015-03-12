subscribing
removeSubscription: aSubscription
	"Removes a subscription from the registry."
	
	| subscriptionCollection |
	subscriptionCollection := subscriptionsByAnnouncementClasses at: aSubscription announcementClass.
	subscriptionCollection remove: aSubscription ifAbsent: nil.
	subscriptionCollection ifEmpty: [
		subscriptionsByAnnouncementClasses 
			removeKey: aSubscription announcementClass
			ifAbsent: nil ]