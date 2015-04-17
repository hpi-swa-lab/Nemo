as yet unclassified
fetchTypeBySelfClass: aProgramNode

	aProgramNode ifNil: [ ^ nil ].
	aProgramNode isMessage
		ifTrue: [ aProgramNode receiver isSelf
			ifTrue: [ aProgramNode selector == #class ifTrue: [
				^ (self model selectedClass)
					ifNotNil: [ :clazz |
						BPGuessedType
							type: clazz class
							guessedFrom: #selfClass ] ] ] ].
	^ nil