as yet unclassified
fetchTypeForNode: aProgramNode

	aProgramNode ifNil: [ ^ nil ].
	aProgramNode isLiteral
		ifTrue: [ ^ aProgramNode value class ]
		ifFalse: [ ^ nil ]