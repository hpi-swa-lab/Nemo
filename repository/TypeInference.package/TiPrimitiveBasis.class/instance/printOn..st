printing
printOn: aStream
	aStream 
		print: selector;
		space;
		print: receiver;
		space;
		print: arguments.
	neverFail 
		ifTrue: [aStream nextPutAll: ' never fails']
		