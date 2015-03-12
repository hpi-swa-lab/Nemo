tests
testIterceptWithWhile4
	| calls intercepted|
	calls := 0.
	intercepted := false.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce: Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions 
		interceptWith: [ :announcement :anAnnouncer |
			self assert: announcement class = Announcement. 
			self assert: anAnnouncer  = announcer.
			intercepted := true]
		while: [announcer announce: Announcement. self assert: intercepted. intercepted := false.].
	self assert: calls = 1.
	announcer announce: Announcement.
	self assert: calls = 2.
	self assert: intercepted not