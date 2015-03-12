tests
testDo
	| count |
	count := 0.
	Announcement do: [ :aClass | 
		self assert: aClass == Announcement.
		count := count + 1 ].
	self assert: count = 1

	