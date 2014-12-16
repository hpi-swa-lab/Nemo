as yet unclassified
guessVarTypeFrom: aVarName

	| curVarName |
	curVarName := aVarName.
	[curVarName size > 0] whileTrue: [
		curVarName := curVarName first asUppercase asString, curVarName allButFirst.
		(Smalltalk at: curVarName asSymbol ifAbsent: []) ifNotNilDo: [ :aClass | ^aClass].
		curVarName := (RxMatcher forString: '^([a-zA-Z][a-z]*)') copy: curVarName replacingMatchesWith: ''.
	].
	^nil