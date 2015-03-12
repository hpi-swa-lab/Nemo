oldtests
testSubcriptionWhenSendTo
	| subscriber |
	announcer := Announcer new.		
	subscriber := TestSubscriber new.
	announcer when: TestAnnouncement1, Announcement send: #run to: subscriber.
	announcer announce: TestAnnouncement1.
	self assert: subscriber runs = 2.
	announcer announce: TestAnnouncement2.
	self assert: subscriber runs = 3.
	
	announcer when: TestAnnouncement2 send: #storeAnnouncement: to: subscriber.
	announcer announce: TestAnnouncement2.
	self assert: subscriber runs = 5.
	self assert: 
		((subscriber announcements collect: [:each | each class]) sortBy: [ :a :b | a name < b name ]) =
		({ UndefinedObject. UndefinedObject. UndefinedObject. UndefinedObject. TestAnnouncement2 } sortBy: [ :a :b | a name < b name]).
	
	announcer when: TestAnnouncement1 send: #storeAnnouncement:andAnnouncer: to: subscriber.
	announcer announce: TestAnnouncement1.
	self assert: subscriber runs = 8.
	self assert:
		(((subscriber announcements copyFrom: 6 to: 8) collect: [:each | each class]) sortBy: [:a :b | a name < b name]) =
		({ UndefinedObject. UndefinedObject. TestAnnouncement1 } sortBy: [ :a :b | a name < b name]).
	self assert:
		(subscriber announcers select: [:each | each isNil not]) asArray = {announcer}.

	announcer announce: TestAnnouncement2 .
	self assert: subscriber runs = 10.
	self assert:
		(subscriber announcers copyFrom: 9 to: 10) asArray = {nil. nil}.
	self assert: (((subscriber announcements copyFrom: 9 to: 10) collect: [:each | each class]) sortBy: [:a :b | a name < b name]) =
		({UndefinedObject. TestAnnouncement2} sortBy: [:a :b | a name < b name]).
