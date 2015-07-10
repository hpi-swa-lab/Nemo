filtering
escapeCharacter: aCharacter
	aCharacter = $:
		ifTrue: [ ^ '\:' ].
	^ aCharacter asString