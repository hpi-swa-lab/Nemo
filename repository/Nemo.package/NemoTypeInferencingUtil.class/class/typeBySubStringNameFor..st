type inferencing
typeBySubStringNameFor: anExpressionString

	| curVarName matcher lastVarName |
	anExpressionString ifNil: [ ^ nil ].
	((RxMatcher forString: '^([a-zA-Z][a-z0-9]*)+$') matchesIn: anExpressionString)
		ifEmpty: [ ^ nil ].
	curVarName := anExpressionString.
	matcher := RxMatcher forString: '^([a-zA-Z][a-z0-9]*)'.
	[curVarName size > 0] whileTrue: [
		lastVarName := curVarName.
		curVarName := curVarName first asUppercase asString, curVarName allButFirst.
		(Smalltalk at: curVarName asSymbol ifAbsent: [])
			ifNotNilDo: [ :aClass | ^ BPGuessedType type: aClass guessedFrom: #variableName ].
		curVarName := matcher
			copy: (NemoParserUtil escapeForRegEx: curVarName)
			replacingMatchesWith: ''.
		lastVarName size = curVarName size "to avoid infinite loops ..."
			ifTrue: [ ^ nil ] ].
	^nil