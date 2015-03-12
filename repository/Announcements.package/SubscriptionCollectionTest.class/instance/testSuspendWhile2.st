tests
testSuspendWhile2
	| calls |
	calls := 0.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce:  Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions suspendWhile: [
		announcer subscriptionRegistry allSubscriptions suspendWhile: [
			announcer announce:  Announcement
		].
		announcer announce:  Announcement
	].
	self assert: calls = 1.
	announcer announce:  Announcement.
	self assert: calls = 2.
