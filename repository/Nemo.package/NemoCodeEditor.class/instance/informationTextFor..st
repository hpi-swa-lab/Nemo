code suggestion
informationTextFor: aBPGuessedType

	| prefix debugInfo |
	prefix := aBPGuessedType isCertain ifTrue: [ 'Type: ' ] ifFalse: [ 'Guessed type: ' ].
	debugInfo := self class displayDebugInformation
		ifTrue: [ (' (via ' , aBPGuessedType asInfoString , ')') asText addAttribute: TextColor gray ]
		ifFalse: [ '' ].
	^ (prefix , aBPGuessedType type) asText , debugInfo