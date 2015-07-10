type inferencing
typeBySelf: aString or: aProgramNode selfClass: aSelfClass

	| isSelf |
	isSelf := aProgramNode
		ifNil: [ aString = 'self' ]
		ifNotNil: [ :aNode | aNode isSelf ].
	^ isSelf ifTrue: [ 
		aSelfClass
			ifNotNil: [ :clazz |
				NemoGuessedType
					type: clazz
					guessedFrom: #self ] ]