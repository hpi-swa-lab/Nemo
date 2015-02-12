finding
variablesWithTypesForClass: aClass inMethod: aSymbol

	^ (self variablesForClass: aClass inMethod: aSymbol) collect: [ :variableName |
		variableName -> (BPBookshelf variableTypeBook typeOfVariable: variableName inClass: aClass inMethod: aSymbol).
	].