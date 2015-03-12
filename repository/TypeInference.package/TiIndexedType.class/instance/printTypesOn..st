printing
printTypesOn: aStream
	indexedVarTypes isEmptyOrNil
		ifTrue: [^ self].
	aStream space;
		printCollection: indexedVarTypes inside: $( and: $)
