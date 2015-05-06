as yet unclassified
testRotateReverseBetween

	self assert: 0 equals: (BPNumberUtil rotateReverse: 1 between: 0 and: 1).
	self assert: 2 equals: (BPNumberUtil rotateReverse: 0 between: 0 and: 2).