accessing
subscriptionsOf: anObject

	| result |
	result := SubscriptionCollection new.
	self allSubscriptionsDo: [ :each | 
		each subscriber == anObject ifTrue: [ 
			result add: each ] ].
	^result