type inferencing
typeBySelfClass: aProgramNode selfClass: aSelfClass

	aProgramNode ifNil: [ ^ nil ].
	aProgramNode isMessage
		ifTrue: [ aProgramNode isSelf
			ifTrue: [ aProgramNode selector == #class ifTrue: [
				^ aSelfClass
					ifNotNil: [ :clazz |
						NemoGuessedType
							type: clazz class
							guessedFrom: #selfClass ] ] ] ].
	^ nil