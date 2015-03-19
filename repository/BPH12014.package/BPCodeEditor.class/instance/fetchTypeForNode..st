as yet unclassified
fetchTypeForNode: aProgramNode

	aProgramNode isLiteral
		ifTrue: [ ^ aProgramNode value class ]
		ifFalse: [ ^ nil ]