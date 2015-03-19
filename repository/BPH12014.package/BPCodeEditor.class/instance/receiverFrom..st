as yet unclassified
receiverFrom: aProgramNode

	aProgramNode isVariable
		ifTrue: [ ^ aProgramNode ].

	aProgramNode isLiteral
		ifTrue: [ ^ aProgramNode ].

	^ nil