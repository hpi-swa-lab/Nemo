private-accessing
at: aSymbol

	^ self dictionary at: aSymbol ifAbsent: [self error: aSymbol asString, ' not provided for Filter']