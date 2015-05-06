type inferencing
typeBySelfClass: aProgramNode selfClass: aSelfClass

	aProgramNode ifNil: [ ^ nil ].
	aProgramNode isMessage
		ifTrue: [ aProgramNode receiver isSelf
			ifTrue: [ aProgramNode selector == #class ifTrue: [
				^ aSelfClass
					ifNotNil: [ :clazz |
						BPGuessedType
							type: clazz class
							guessedFrom: #selfClass ] ] ] ].
	^ nil