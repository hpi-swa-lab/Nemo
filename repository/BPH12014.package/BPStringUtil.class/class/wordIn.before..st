as yet unclassified
wordIn: aString before: anInteger

	| index word |
	word := ''.
	index := anInteger - 1.
	[ index > 0 and: [(aString at: index) isSeparator] ] whileTrue: [
		index := index - 1.
	].

	[ index > 0 ] whileTrue: [ | nextCharacter |
		nextCharacter := aString at: index.
		nextCharacter isSeparator ifTrue: [ ^ word ].
		word := nextCharacter asString , word.
		index := index - 1.
	].
	^ word