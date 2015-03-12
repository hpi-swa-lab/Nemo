subscriptions
when: anAnnouncementClassOrCollection send: aSelector to: anObject

	| subscriptions |
	anAnnouncementClassOrCollection isSymbol ifTrue: [
		^super when: anAnnouncementClassOrCollection send: aSelector to: anObject ].
	subscriptions := SubscriptionCollection new.
	anAnnouncementClassOrCollection do: [ :each |
		| subscription |
		(self mayAnnounce: each)
			ifFalse: [ self error: self asString, ' may not announce ', each asString ].
		subscription := registry subscriptionClass
			newWithSelector: aSelector
			announcer: self
			announcementClass: each
			subscriber: anObject.
		subscriptions add: subscription.
		registry register: subscription ].
	^subscriptions