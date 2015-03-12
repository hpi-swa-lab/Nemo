tests
testIterceptWithWhileDeliverFrom1
	| calls |
	calls := 0.
	announcer when: Announcement do: [calls := calls + 1].
	announcer announce: Announcement.
	self assert: calls = 1.
	announcer subscriptionRegistry allSubscriptions 
		interceptWith: [ :announcement :anAnnouncer :subscription | subscription deliver: announcement  from: anAnnouncer]
		while: [announcer announce: Announcement.].
	self assert: calls = 2.
	announcer announce: Announcement.
	self assert: calls = 3.

