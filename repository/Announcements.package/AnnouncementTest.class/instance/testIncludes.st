tests
testIncludes
	self assert: (Announcement includes: Announcement).
	self assert: (Announcement includes: Object) not.
	self assert: (Announcement includes: TestAnnouncement1) not.		

	
	

	