subscribing
register: aSubscription

	(subscriptionsByAnnouncementClasses 
		at: aSubscription announcementClass
		ifAbsentPut: [ SubscriptionCollection new ]) 
		add: aSubscription.