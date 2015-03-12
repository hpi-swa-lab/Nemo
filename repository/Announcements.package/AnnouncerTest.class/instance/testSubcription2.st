oldtests
testSubcription2
	| x |
	x := 0.
	announcer := Announcer new.	
	announcer when: {TestAnnouncement1. Announcement} do: [:ann |x := x + 1].
	self assert: (announcer announce: TestAnnouncement1 new) class = TestAnnouncement1.
	self assert: (x = 2).
	self assert: (announcer announce: TestAnnouncement2 new) class = TestAnnouncement2.
	self assert: (x = 3).
	self assert: (announcer announce: Announcement new) class = Announcement .
	self assert: (x = 4).
