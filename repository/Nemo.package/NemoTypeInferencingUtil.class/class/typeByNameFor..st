type inferencing
typeByNameFor: anExpressionString

	| curVarName |
	anExpressionString ifNil: [ ^ nil ].
	((RxMatcher forString: '^([a-zA-Z][a-z0-9]*)+$') matchesIn: anExpressionString)
		ifEmpty: [ ^ nil ].
	curVarName := anExpressionString.
	[curVarName size > 0] whileTrue: [
		curVarName := curVarName first asUppercase asString, curVarName allButFirst.
		(Smalltalk at: curVarName asSymbol ifAbsent: [])
			ifNotNilDo: [ :aClass | ^ BPGuessedType type: aClass guessedFrom: #variableName ].
		curVarName := (RxMatcher
			forString: '^([a-zA-Z][a-z0-9]*)')
			copy: (NemoParserUtil escapeForRegEx: curVarName)
			replacingMatchesWith: '' ].
	^nil