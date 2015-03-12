tests
testIterceptWithWhile2
	| calls intercepted intercepted2 |
	calls := 0.
	intercepted := false.
	intercepted2 := false.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce: Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions 
		interceptWith: [intercepted := true]
		while: [
			announcer subscriptionRegistry allSubscriptions 
				interceptWith: [intercepted2 := true]
				while: [
					announcer announce: Announcement.
					self assert: intercepted.					
					self assert: intercepted2.
					intercepted := false.
					intercepted2 := false.
				].
		].
	self assert: calls = 1.
	announcer announce: Announcement.
	self assert: calls = 2.
	self assert: intercepted not.					
	self assert: intercepted2 not.