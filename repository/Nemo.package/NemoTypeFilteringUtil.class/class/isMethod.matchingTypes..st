filtering
isMethod: methodReference matchingTypes: variableTypes

	| pair dict paramsWithTypes paramWithType |
	methodReference compiledMethod numArgs = 1 ifFalse: [ ^ nil ].
	dict := NemoParserUtil
		parseMethodArgsAndTempVarNamesIn: methodReference sourceString
		for: Morph.
	paramsWithTypes := (dict at: #patternArg ifAbsent: {})
		collect: [ :varName |
			varName -> ((NemoTypeInferencingUtil typeByNameFor: varName) ifNotNil: [:guessedType | guessedType type ]) ].
	paramsWithTypes ifEmpty: [ ^ nil ].
	paramWithType := paramsWithTypes first.
	paramWithType value = Object ifTrue: [ ^ nil ].
	pair := variableTypes associations detect: [ :variableType | variableType value == paramWithType value or: [variableType value inheritsFrom: paramWithType value] ] ifNone: [].
	^ pair