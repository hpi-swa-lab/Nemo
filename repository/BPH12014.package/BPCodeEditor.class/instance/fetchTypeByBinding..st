as yet unclassified
fetchTypeByBinding: aString
	 ^ (self fetchValueByBinding: aString) ifNotNil: [ :value |
		BPGuessedType
			type: value class
			guessedFrom: #bindings ].