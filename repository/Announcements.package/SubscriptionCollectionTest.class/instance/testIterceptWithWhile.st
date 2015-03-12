tests
testIterceptWithWhile
	| calls intercepted |
	calls := 0.
	intercepted := false.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce: Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions 
		interceptWith: [intercepted := true]
		while: [announcer announce: Announcement].
	self assert: calls = 1.
 	self assert: intercepted = true.
	announcer announce: Announcement.
	self assert: calls = 2.
	intercepted := false.
	announcer subscriptionRegistry allSubscriptions 
		interceptWith: [intercepted := true] while: [calls := calls + 1].
	self assert: calls = 3.
	self assert: intercepted = false