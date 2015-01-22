finding
findMethodSelectorsContaining: aSubString forClass: aClass
	| aSubStringLow |
	aSubStringLow := aSubString asLowercase.
	^ aClass methodDict keys select: [ :selector | selector asLowercase includesSubString: aSubStringLow ]
	