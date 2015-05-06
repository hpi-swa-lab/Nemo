finding
argVariablesForClass: aClass inSourceCode: aString

	^ BPParserUtil tokenValuesFor: aClass inSourceCode: aString matching: [ :anSHRange |
		anSHRange type = #patternArg.
	].