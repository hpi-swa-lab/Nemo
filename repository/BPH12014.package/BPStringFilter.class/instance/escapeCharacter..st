as yet unclassified
escapeCharacter: aCharacter
	aCharacter = $:
		ifTrue: [ ^ '\:' ].
	^ aCharacter asString