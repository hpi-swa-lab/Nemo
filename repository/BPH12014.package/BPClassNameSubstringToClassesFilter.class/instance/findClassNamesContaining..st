private-processing
findClassNamesContaining: aSubString
	| aSubStringLower |
	aSubStringLower := aSubString asLowercase.
	^ (SystemNavigation allClasses select: [ :clazz | clazz name asLowercase includesSubString: aSubStringLower ])
		collect: [ :clazz | clazz name ]
	