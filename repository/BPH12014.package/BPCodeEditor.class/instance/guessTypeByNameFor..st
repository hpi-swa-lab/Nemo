as yet unclassified
guessTypeByNameFor: anExpressionString

	| curVarName |
	((RxMatcher forString: '^([a-zA-Z][a-z0-9]*)') matchesIn: anExpressionString)
		ifEmpty: [ ^ nil ].
	curVarName := anExpressionString.
	[curVarName size > 0] whileTrue: [
		curVarName := curVarName first asUppercase asString, curVarName allButFirst.
		(Smalltalk at: curVarName asSymbol ifAbsent: []) ifNotNilDo: [ :aClass | ^aClass].
		curVarName := (RxMatcher forString: '^([a-zA-Z][a-z0-9]*)') copy: (BPParserUtil escapeForRegEx: curVarName) replacingMatchesWith: ''.
	].
	^nil