accessing
subscriptionsFor: anAnnouncementClassOrCollection

	| result |
	result := SubscriptionCollection new.
	anAnnouncementClassOrCollection do: [:each |
		subscriptionsByAnnouncementClasses 
			at: each 
			ifPresent: [ :subscriptionCollection |
				result addAll: subscriptionCollection ] ].
	^result