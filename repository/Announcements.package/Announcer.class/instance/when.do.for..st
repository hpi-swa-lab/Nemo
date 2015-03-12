subscriptions
when: anAnnouncementClassOrCollection do: aBlock for: anObject

	| subscriptions |
	subscriptions := SubscriptionCollection new.
	anAnnouncementClassOrCollection do: [:each |
		| subscription |
		(self mayAnnounce: each) 
			ifFalse: [
				self error: self asString, ' may not announce ', each asString ].
		subscription := registry subscriptionClass
			newWithAction: aBlock
			announcer: self
			announcementClass: each
			subscriber: anObject.
		subscriptions add: subscription.
		registry register: subscription ].
	^subscriptions