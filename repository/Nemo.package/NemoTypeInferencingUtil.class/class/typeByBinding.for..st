type inferencing
typeByBinding: aString for: aModel
	 ^ (self valueByBinding: aString for: aModel) ifNotNil: [ :value |
		NemoGuessedType
			type: value class
			guessedFrom: #bindings ].