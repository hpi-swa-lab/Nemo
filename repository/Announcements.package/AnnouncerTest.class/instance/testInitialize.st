tests
testInitialize
	announcer := Announcer new.
	self assert: announcer subscriptionRegistry isNil not

	