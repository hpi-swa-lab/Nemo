printing
printTypesOn: aStream
	aStream 
		nextPutAll: self descriptionString;
		printCollection: typeSet inside: $| and: $|

