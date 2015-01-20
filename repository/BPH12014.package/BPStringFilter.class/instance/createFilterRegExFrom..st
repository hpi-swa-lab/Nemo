as yet unclassified
createFilterRegExFrom: aFilterString

	aFilterString ifEmpty: [^nil].
	^ RxMatcher forString: (
		'.*',
		((aFilterString asArray collect: [ :aCharacter |
			aCharacter asString.
		]) join: '.*'),
		'.*')