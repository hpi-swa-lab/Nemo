parsing
argumentNamesFromMethodReference: aMethodReference

	^ self tokenValuesFor: aMethodReference actualClass
		inSourceCode: aMethodReference sourceCode asString
		matching: [ :anSHRange | anSHRange type = #patternArg ].