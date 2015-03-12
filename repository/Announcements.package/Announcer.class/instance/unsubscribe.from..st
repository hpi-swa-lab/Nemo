subscriptions
unsubscribe: anObject from: anAnnouncementClassOrCollection

	| subscriptions |
	subscriptions := registry
		subscriptionsOf: anObject
		for: anAnnouncementClassOrCollection.
	subscriptions ifEmpty: [
		self error: anObject asString, ' has no subscriptions on ', anAnnouncementClassOrCollection asString].
	registry removeSubscriptions: subscriptions.