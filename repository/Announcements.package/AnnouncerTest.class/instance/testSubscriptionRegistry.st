tests
testSubscriptionRegistry
	announcer := Announcer new.
	self assert: announcer subscriptionRegistry class == SubscriptionRegistry.
	