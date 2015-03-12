tests
testAsAnnouncement
	| a |
	a := Announcement new.
	self assert: a = a asAnnouncement.
	self assert: Announcement asAnnouncement class = Announcement 