weak-strong
makeWeak
	"Create and register a new weak subscription for all the subscriptions in this collection, while removing the old subscriptions from the registry."
	
	^self make: WeakSubscription