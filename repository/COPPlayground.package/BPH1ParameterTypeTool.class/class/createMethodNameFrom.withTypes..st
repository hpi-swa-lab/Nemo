as yet unclassified
createMethodNameFrom: aMethodSymbol withTypes: typeInfo

	| typedMethodName methodParts index typeStrings |
	typeStrings := self createTypeStringsFrom: typeInfo.
	typedMethodName := ''.
	methodParts := aMethodSymbol splitBy: ':'.
	typedMethodName := typedMethodName, methodParts first.
	index := 0.
	methodParts copyWithoutFirst do: [ :nextPart |
		index := index + 1.
		typedMethodName := typedMethodName, ':(', (typeStrings at: index ifAbsent: ['']),')', nextPart
	].
	^typedMethodName