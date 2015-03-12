tests
testAnnounce
	"Subclasses of AXAnnouncement should be able to be announced, other classes shouldn't.
	Announcement objects (instances of AXAnnouncement or any of it's subclasses') should be able to be announced, others shouldn't
	#announce: should return the created announcement.
	#announce: should deliver an announcement to all the subscriptions that are subscribed for the class of the announcement or it's superclasses, that are subclasses of AXAnnouncement."
	| runs result |
	announcer := Announcer new.
	Announcement, TestAnnouncement1, TestAnnouncement2 do: [ :each | 
		result := announcer announce: each.
		self assert: result class == each.
		result := announcer announce: each new.
		self assert: result class == each].
	{ Object. ProtoObject. Array } do: [ :each | 
		self should: [ announcer announce: each ] raise: Error.
		self should: [ announcer announce: each basicNew ] raise: Error].
	
	runs := 0.
	announcer when: Announcement do: [ :anAnnouncement | 
		self assert: (anAnnouncement isKindOf: Announcement).
		runs := runs + 1].
	announcer when: TestAnnouncement1 do: [ :anAnnouncement | 
		self assert: anAnnouncement class == TestAnnouncement1.
		anAnnouncement x: 42.
		runs := runs + 1 ].
	self assert: announcer subscriptionRegistry allSubscriptions size = 2.
	
	result := announcer announce: TestAnnouncement1.
	self assert: result class == TestAnnouncement1.
	self assert: result x = 42.
	self assert: runs = 2.
	runs := 0.
	result := announcer announce: Announcement.
	self assert: result class == Announcement.
	self assert: runs = 1.
	
	