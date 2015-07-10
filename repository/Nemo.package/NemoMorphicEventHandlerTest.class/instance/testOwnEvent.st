as yet unclassified
testOwnEvent

	| triggered |
	triggered := 0.
	ownerMorph on: #testEvent do: [
		triggered := triggered + 1.
	].
	self assert: 0 equals: triggered.
	ownerMorph emit: #testEvent.
	self assert: 1 equals: triggered.