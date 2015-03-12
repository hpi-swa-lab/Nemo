oldtests
testUnsubscribe
	| subscriber |
	announcer := Announcer new.		
	self should: [announcer unsubscribe: Object new] raise: Error.
	self should: [announcer unsubscribe: Object new from: Announcement]
		raise: Error.
		
	subscriber := Object new.
	
	announcer when: Announcement, TestAnnouncement1 do: [] for: subscriber.
	self assert: (announcer subscriptionRegistry subscriptionsOf: subscriber)  size = 2.
	announcer unsubscribe: subscriber.
	self assert: (announcer subscriptionRegistry subscriptionsOf: subscriber) isEmpty.
	
	announcer when: Announcement, TestAnnouncement2 do: [] for: subscriber.
	self assert: (announcer subscriptionRegistry subscriptionsOf: subscriber)  size = 2.
	announcer unsubscribe: subscriber from: Announcement.
	self assert: (announcer subscriptionRegistry subscriptionsOf: subscriber) size = 1.
	self assert: (announcer subscriptionRegistry subscriptionsOf: subscriber for: Announcement) isEmpty.
	self assert: (announcer subscriptionRegistry subscriptionsOf: subscriber for: TestAnnouncement2 ) size = 1.
	
	
