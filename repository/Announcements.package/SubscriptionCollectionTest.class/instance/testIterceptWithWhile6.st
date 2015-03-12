tests
testIterceptWithWhile6
	| calls intercepted|
	calls := 0.
	intercepted := false.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce: Announcement.
	self assert: calls = 1.
	self should: [announcer subscriptionRegistry allSubscriptions 
		interceptWith: [ :announcement :anAnnouncer :subscription :badParameter|
			intercepted := true]
		while: [announcer announce: Announcement. self assert: intercepted. intercepted := false.]] raise: Error.
	self assert: calls = 1.
	announcer announce: Announcement.
	self assert: calls = 2.
	self assert: intercepted not