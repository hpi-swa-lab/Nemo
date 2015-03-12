tests
testMultipleSubscriptions
	| newSubscriptions |
	announcer := Announcer new.
	newSubscriptions := announcer when: TestAnnouncement1, TestAnnouncement2 do:
		[].
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 2.
	
	self assert: announcer subscriptionRegistry allSubscriptions size = 2.
	self assert: (announcer subscriptionRegistry allSubscriptions collect: 
		[ :each | each announcementClass ]) asSet = { TestAnnouncement1. TestAnnouncement2} asSet.
	announcer := Announcer new.
	newSubscriptions := announcer when: Announcement, TestAnnouncement1, 
		TestAnnouncement2 do: [] for: [].
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 3.
	self assert: announcer subscriptionRegistry allSubscriptions size = 3.
	
	announcer := Announcer new.
	newSubscriptions := announcer when: Announcement, Announcement send: #yourself to: [].
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 2.
	self assert: announcer subscriptionRegistry allSubscriptions size = 2.
	
	announcer := Announcer new.
	newSubscriptions := announcer when: {Announcement. Announcement} send: #yourself to: [].
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 2.
	self assert: announcer subscriptionRegistry allSubscriptions size = 2.
	
	announcer := Announcer new.
	newSubscriptions := announcer when: {Announcement} send: #yourself to: [].
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	self assert: announcer subscriptionRegistry allSubscriptions size = 1.
		
	