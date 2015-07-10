as yet unclassified
testOwnEventWithArgs

	| triggered |
	triggered := 0.
	ownerMorph on: #testEvent do: [ :number1 |
		self assert: 1 equals: number1.
		triggered := triggered + 1.
	].
	self assert: 0 equals: triggered.
	ownerMorph emit: #testEvent withArgs: {1}.
	self assert: 1 equals: triggered.