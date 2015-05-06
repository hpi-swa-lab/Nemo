type inferencing
typeByBinding: aString for: aModel
	 ^ (self valueByBinding: aString for: aModel) ifNotNil: [ :value |
		BPGuessedType
			type: value class
			guessedFrom: #bindings ].