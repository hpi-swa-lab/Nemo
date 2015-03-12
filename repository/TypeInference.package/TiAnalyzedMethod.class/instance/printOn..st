printing
printOn: aStream
	aStream
		print: class;
		nextPutAll: ' | ';
		print: selector