tests
testMayAnnounce
	announcer := Announcer new.
	Announcement, TestAnnouncement1, TestAnnouncement2 do: [ :each |
		self assert: (announcer mayAnnounce: each) ].
	{ Object. ProtoObject. Array } do: [ :each |
		self assert: (announcer mayAnnounce: each) not ]
	