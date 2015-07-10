filtering
filterMethods: methodReferences matchingTypes: variableTypes

	| pair |
	^ methodReferences select: [ :methodReference | | dict paramsWithTypes paramWithType |
		dict := NemoParserUtil
			parseMethodArgsAndTempVarNamesIn: methodReference sourceString
			for: Morph.
		paramsWithTypes := (dict at: #patternArg ifAbsent: {})
			collect: [ :varName |
				varName -> ((NemoTypeInferencingUtil typeByNameFor: varName) ifNotNil: [:guessedType | guessedType type ]) ].
		paramWithType := paramsWithTypes first.
		pair := variableTypes detect: [ :variableType | variableType value = paramWithType value ] ifNone: [].
		pair notNil ]