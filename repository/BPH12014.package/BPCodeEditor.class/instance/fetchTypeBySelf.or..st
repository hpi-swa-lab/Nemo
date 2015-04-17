as yet unclassified
fetchTypeBySelf: aString or: aProgramNode

	| isSelf |
	isSelf := aProgramNode
		ifNil: [ aString = 'self' ]
		ifNotNil: [ :aNode | aNode isSelf ].
	^ isSelf ifTrue: [ 
		(self model selectedClass)
			ifNotNil: [ :clazz |
				BPGuessedType
					type: clazz
					guessedFrom: #self ] ]