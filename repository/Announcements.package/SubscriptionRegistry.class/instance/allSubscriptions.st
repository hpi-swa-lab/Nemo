accessing
allSubscriptions

	| result |
	result := SubscriptionCollection new.
	subscriptionsByAnnouncementClasses valuesDo: [ :each |
		result addAll: each ].
	^result