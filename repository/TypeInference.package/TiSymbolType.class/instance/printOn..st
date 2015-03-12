printing
printOn: aStream
	aStream 
		nextPut: $<;
		print: symbol;
		nextPut: $>
