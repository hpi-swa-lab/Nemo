oldtests
testSubcriptionCollection
	| x |
	x := 0.
	announcer := Announcer new.	
	announcer when: {TestAnnouncement1. TestAnnouncement2 } do: [ :ann | ann x: 1. x := x + 1].
	self assert: (announcer announce: TestAnnouncement1 new) x = 1.
	self assert: (announcer announce: TestAnnouncement2 new) x = 1.
	self assert: x = 2.
