private-processing
guessTypeForName: aVarName

	| curVarName matcher |
	curVarName := aVarName.
	matcher := RxMatcher forString: '^([a-zA-Z][a-z0-9]*)'.
	[curVarName size > 0] whileTrue: [
		curVarName := curVarName first asUppercase asString, curVarName allButFirst.
		(Smalltalk at: curVarName asSymbol ifAbsent: []) ifNotNilDo: [ :aClass | ^aClass].
		curVarName := matcher copy: curVarName replacingMatchesWith: ''.
	].
	^nil