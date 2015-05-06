as yet unclassified
testRotateBetween

	self assert: 1 equals: (BPNumberUtil rotate: 0 between: 0 and: 1).
	self assert: 0 equals: (BPNumberUtil rotate: 2 between: 0 and: 2).