as yet unclassified
regexStringFrom: aFilterString

	^
		'.*' ,
		((aFilterString asArray collect: [ :aCharacter |
			self escapeCharacter: aCharacter
		]) join: '.*') ,
		'.*'