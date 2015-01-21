as yet unclassified
filterClassesNames: aClassNameList containing: aSubString
	| substringLow |
	substringLow := aSubString asLowercase.
	^ aClassNameList select: [ :className | className asLowercase includesSubString: substringLow ]
	