finding
tempVariablesForClass: aClass inSourceCode: aString

	| variableNames |
	variableNames := OrderedCollection new.
	(NemoParserUtil parseTokensIn: aString for: aClass) do: [ :anSHRange |
		(NemoParserUtil isTemporaryVariable: anSHRange) ifTrue: [
			variableNames add: (aString copyFrom: anSHRange start to: anSHRange end)]].
	^ variableNames