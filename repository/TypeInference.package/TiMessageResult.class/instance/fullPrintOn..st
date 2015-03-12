printing
fullPrintOn: aStream
	super printOn: aStream.
	aStream 
		nextPutAll: ' receiver ';
		printCollection: receiver inside: ${ and: $}.
