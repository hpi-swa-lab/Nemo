finding
variablesForClass: aClass inMethod: aSymbol

	^ self variablesForClass: aClass inSourceCode: (aClass methodDict at: aSymbol) getSource asString