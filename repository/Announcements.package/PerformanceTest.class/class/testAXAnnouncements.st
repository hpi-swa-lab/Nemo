as yet unclassified
testAXAnnouncements
	| results |
	results := Dictionary new.
	self testValues do: [ :each | | foo partialResults |
		partialResults := OrderedCollection new.
		4 timesRepeat: [
			Smalltalk garbageCollect.
			foo := Announcer new.
			"foo subscriptionRegistry subscriptionClass: AXWeakSubscription."
			1 to: each do: [:i | foo when: Announcement send: #yourself to: i].
			
			partialResults add: [100000 timesRepeat: [foo announce: Announcement]] timeToRun.
			Transcript show: thisContext methodSelector asString, ' subscription #', each asString, ' partialResult #', partialResults size asString, ': ', partialResults last asString, ' msecs'; cr.
		].
		results at: each put: (partialResults copyFrom: 2 to: 4) sum // 3.
		Transcript show: thisContext methodSelector asString, ' subscription #', each asString, ' result: ', (results at: each) asString, ' msecs'; cr.
	].
	^results