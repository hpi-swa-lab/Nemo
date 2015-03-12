subscriptions
unsubscribe: anObject

	| subscriptions |
	subscriptions := registry subscriptionsOf: anObject.
	subscriptions ifEmpty: [
		self error: 'No subscriptions for ', anObject asString ].
	registry removeSubscriptions: subscriptions.