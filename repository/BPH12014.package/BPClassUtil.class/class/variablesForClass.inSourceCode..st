finding
variablesForClass: aClass inSourceCode: aString

	^ aClass allInstVarNames asOrderedCollection
		addAll: (self tempVariablesForClass: aClass inSourceCode: aString);
		addAll: (self argVariablesForClass: aClass inSourceCode: aString);
		yourself.