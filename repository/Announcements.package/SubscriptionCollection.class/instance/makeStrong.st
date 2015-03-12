weak-strong
makeStrong
	"Create and register a new strong subscription for all the subscriptions in this collection, while removing the old subscriptions from the registry."
	
	^self make: StrongSubscription