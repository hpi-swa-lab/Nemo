as yet unclassified
messageAround: aProgramNode

	| currentNode |
	currentNode := aProgramNode.
	[currentNode notNil] whileTrue: [
		currentNode isMessage
			ifTrue: [ ^ currentNode ]
			ifFalse: [ currentNode := currentNode parent ]
	].
	^ nil