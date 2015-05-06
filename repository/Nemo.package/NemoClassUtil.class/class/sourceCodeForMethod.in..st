finding
sourceCodeForMethod: aSymbol in: aClass

	^ (aClass methodDict at: aSymbol) getSource asString