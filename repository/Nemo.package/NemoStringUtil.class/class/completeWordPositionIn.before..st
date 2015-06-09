word detection
completeWordPositionIn: aString before: anInteger

	| isInWord index |
	isInWord := false.
	index := anInteger.
	aString size >= anInteger ifTrue: [ | nextCharacter |
		nextCharacter := aString at: anInteger.
		isInWord := nextCharacter isNodeSeparator not ].

	isInWord ifTrue: [
		[ index > 0 and: [(aString at: index) isSeparator not]] whileTrue: [
			index := index - 1.
		].
	].
	index = 0 ifTrue: [ ^ 1 to: 0 ].
	^ self wordPositionIn: aString before: index - 1.