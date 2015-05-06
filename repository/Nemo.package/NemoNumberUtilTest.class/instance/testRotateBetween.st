as yet unclassified
testRotateBetween

	self assert: 1 equals: (NemoNumberUtil rotate: 0 between: 0 and: 1).
	self assert: 0 equals: (NemoNumberUtil rotate: 2 between: 0 and: 2).