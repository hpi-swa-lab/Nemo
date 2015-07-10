type inferencing
typeBySuper: aString or: aProgramNode selfClass: aSelfClass

	| isSuper |
	isSuper := aProgramNode
		ifNil: [ aString = 'super' ]
		ifNotNil: [ :aNode | aNode isSuper ].
	^ isSuper ifTrue: [ 
		aSelfClass
			ifNotNil: [ :clazz |
				NemoGuessedType
					type: clazz superclass
					guessedFrom: #super ] ]