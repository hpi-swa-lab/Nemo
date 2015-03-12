private
make: aSubscriptionClass
	"Create and register a new subscription of aSubscriptionClass for all the subscriptions in this collection while removing the old subscriptions from the registry."
	
	^self collect: [ :each | 
		| registry subscription |
		registry := each announcer subscriptionRegistry.
		registry removeSubscription: each.
 		subscription := each selector
			ifNil: [ aSubscriptionClass 
				newWithAction: each action
				announcer: each announcer
				announcementClass: each announcementClass
				subscriber: each subscriber ]
			ifNotNil: [ aSubscriptionClass
				newWithSelector: each selector
				announcer: each announcer
				announcementClass: each announcementClass
				subscriber: each subscriber ].
		registry register: subscription.
		subscription ]