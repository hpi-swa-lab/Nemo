printing
printOn: aStream
	
	super printOn: aStream.
	aStream
		nextPutAll: ', ';
		nextPutAll: (self partialMethods size + (self includesBaseMethod ifTrue: [ 1 ] ifFalse: [ 0 ])) asString;
		nextPutAll: ' version(s))'.