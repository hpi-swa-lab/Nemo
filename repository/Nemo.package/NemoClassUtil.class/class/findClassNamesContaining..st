finding
findClassNamesContaining: aSubString
	^ (SystemNavigation allClasses select: [ :clazz | clazz name asLowercase includesSubString: aSubString ])
		collect: [ :clazz | clazz name ]
	