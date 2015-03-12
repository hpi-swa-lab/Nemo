tests
testIterceptWithWhileDeliverFrom
	| calls intercepted|
	calls := 0.
	intercepted := false.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce: Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions 
		interceptWith: [ :announcement :anAnnouncer :subscription |
			subscription deliver: announcement  from: anAnnouncer.
			intercepted := true]
		while: [announcer announce: Announcement. self assert: intercepted. intercepted := false.].
	self assert: calls = 2.
	announcer announce: Announcement.
	self assert: calls = 3.
	self assert: intercepted not