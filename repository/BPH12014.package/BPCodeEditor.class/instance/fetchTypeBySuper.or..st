as yet unclassified
fetchTypeBySuper: aString or: aProgramNode

	| isSuper |
	isSuper := aProgramNode
		ifNil: [ aString = 'super' ]
		ifNotNil: [ :aNode | aNode isSuper ].
	^ isSuper ifTrue: [ 
		(self model selectedClass)
			ifNotNil: [ :clazz |
				BPGuessedType
					type: clazz superclass
					guessedFrom: #super ] ]