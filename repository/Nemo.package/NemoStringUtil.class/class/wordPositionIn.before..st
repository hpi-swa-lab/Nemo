word detection
wordPositionIn: aString before: anInteger

	| index word |
	word := ''.
	index := anInteger - 1.
	[ index > 0 and: [(aString at: index) isSeparator] ] whileTrue: [
		index := index - 1 ].

	[ index > 0 ] whileTrue: [ | nextCharacter |
		nextCharacter := aString at: index.
		nextCharacter isSeparator ifTrue: [ ^ index to: anInteger ].
		word := nextCharacter asString , word.
		index := index - 1 ].
	^ index + 1 to: anInteger - 1