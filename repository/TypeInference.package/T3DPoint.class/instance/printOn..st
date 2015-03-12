printing
printOn: aStream
	aStream nextPut: $(.
	x printOn: aStream.
	aStream nextPut: $,.
	y printOn: aStream.
	aStream nextPut: $,.	
	z printOn: aStream.
	aStream nextPut: $).