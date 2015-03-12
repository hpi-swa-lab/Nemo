tests
testIterceptWithWhile5
	| calls intercepted|
	calls := 0.
	intercepted := false.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce: Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions 
		interceptWith: [ :announcement :anAnnouncer :subscription |
			self assert: announcement class = Announcement. 
			self assert: anAnnouncer  = announcer.
			self assert: announcer  subscriptionRegistry allSubscriptions first = subscription.
			intercepted := true]
		while: [announcer announce: Announcement. self assert: intercepted. intercepted := false.].
	self assert: calls = 1.
	announcer announce: Announcement.
	self assert: calls = 2.
	self assert: intercepted not