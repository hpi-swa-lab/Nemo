accessing
allSubscriptionsDo: aBlock

	subscriptionsByAnnouncementClasses valuesDo: [ :each |
		each do: aBlock ]