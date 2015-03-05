finding
tempVariablesForClass: aClass inSourceCode: aString

	| variableNames |
	variableNames := OrderedCollection new.
	(BPParserUtil parseTokensIn: aString for: aClass) do: [ :anSHRange |
		(BPParserUtil isTemporaryVariable: anSHRange) ifTrue: [
			variableNames add: (aString copyFrom: anSHRange start to: anSHRange end)]].
	^ variableNames