oldtests
testSubcription1
	| x |
	x := 0.
	announcer := Announcer new.	
	announcer when: Announcement do: [:ann |x := x + 1].
	self assert: (announcer announce: TestAnnouncement1 new) class = TestAnnouncement1.
	self assert: (announcer announce: TestAnnouncement2 new) class = TestAnnouncement2.
	self assert: (x = 2).
