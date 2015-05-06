word detection
completeWordIn: aString before: anInteger

	| isInWord index |
	isInWord := false.
	index := anInteger.
	aString size >= anInteger ifTrue: [ | nextCharacter |
		nextCharacter := aString at: anInteger.
		isInWord := nextCharacter isSeparator not ].

	isInWord ifTrue: [
		[ index > 0 and: [(aString at: index) isSeparator not]] whileTrue: [
			index := index - 1.
		].
	].
	index = 0 ifTrue: [ ^ '' ].
	^ self wordIn: aString before: index.