tests
testSuspendWhileIfAnyMissed2
	| calls misses |
	calls := 0.
	misses := 0.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce: Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions suspendWhile: 
			[announcer subscriptionRegistry allSubscriptions 
				suspendWhile: [announcer announce: Announcement]
				ifAnyMissed: [misses := misses + 1]]
	ifAnyMissed: [misses := misses + 1].
	self assert: calls = 1.
	self assert: misses = 2.
	announcer announce: Announcement.
	self assert: calls = 2.
	announcer subscriptionRegistry allSubscriptions suspendWhile: [
		announcer subscriptionRegistry allSubscriptions 
				suspendWhile: [ calls := calls + 1]
				ifAnyMissed: [misses := misses + 1].
		announcer announce: Announcement				
	] ifAnyMissed: [misses := misses + 1].
	self assert: calls = 3.
	self assert: misses = 3.
	announcer subscriptionRegistry allSubscriptions suspendWhile: [
		announcer subscriptionRegistry allSubscriptions 
				suspendWhile: [ announcer announce: Announcement]
				ifAnyMissed: [misses := misses + 1].
		announcer announce: Announcement				
	] ifAnyMissed: [misses := misses + 1].
	self assert: misses = 5.

	