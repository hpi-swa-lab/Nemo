finding
argVariablesForClass: aClass inSourceCode: aString

	^ NemoParserUtil tokenValuesFor: aClass inSourceCode: aString matching: [ :anSHRange |
		anSHRange type = #patternArg.
	].