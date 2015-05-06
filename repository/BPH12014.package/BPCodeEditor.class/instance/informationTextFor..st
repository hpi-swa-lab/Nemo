code suggestion
informationTextFor: aBPGuessedType

	| prefix |
	prefix := aBPGuessedType isCertain ifTrue: [ 'Type: ' ] ifFalse: [ 'Guessed type: ' ].
	^ prefix , aBPGuessedType type , ' (via ' , aBPGuessedType asInfoString , ')'