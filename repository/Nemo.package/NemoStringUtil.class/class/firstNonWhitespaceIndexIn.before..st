word detection
firstNonWhitespaceIndexIn: aString before: anInteger

	| currentChar index |
	anInteger < 1 ifTrue: [ ^ 1 ].
	index := anInteger min: aString size.
	currentChar := aString at: index.
	[ index > 1 and: [currentChar isSeparator] ] whileTrue: [
		index := index - 1.
		currentChar := aString at: index ].
	^ index