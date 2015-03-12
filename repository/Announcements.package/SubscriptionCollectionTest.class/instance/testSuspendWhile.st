tests
testSuspendWhile
	| calls |
	calls := 0.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce:  Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions suspendWhile: [announcer announce:  Announcement].
	self assert: calls = 1.
	announcer announce:  Announcement.
	self assert: calls = 2.
