tests
testSuspendWhileIfAnyMissed
	| calls anyMissed |
	calls := 0.
	anyMissed := false.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce:  Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions suspendWhile: [announcer announce:  Announcement] ifAnyMissed: [ anyMissed := true ].
	self assert: calls = 1.
	self assert: anyMissed = true.
	announcer announce:  Announcement.
	self assert: calls = 2.
	anyMissed := false.
	announcer subscriptionRegistry allSubscriptions suspendWhile: [calls := calls + 1] ifAnyMissed: [ anyMissed := true ].
	self assert: calls = 3.
	self assert: anyMissed = false.
	
	
