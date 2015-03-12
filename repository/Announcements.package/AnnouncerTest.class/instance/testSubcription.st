oldtests
testSubcription
	| runs |
	runs := 0.
	announcer := Announcer new.		
	announcer when: TestAnnouncement1
		do: 
			[:ann | 
			ann x: 1.
			runs := runs + 1].
	self assert: (announcer announce: TestAnnouncement1) x = 1.
	self assert: runs = 1.
	announcer when: TestAnnouncement1
		do: 
			[:ann | 
			ann x: 2.
			runs := runs + 1].
	self 
		assert: (#(1 2 ) includes: (announcer announce: TestAnnouncement1) x).
	self assert: runs = 3.
	self assert: (announcer announce: Announcement) class = Announcement.
	self assert: runs = 3