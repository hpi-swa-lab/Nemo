printing
printOn: aStream
	aStream 
		nextPut: $<;
		print: self exactClass;
		space;
		print: blockNode;
		nextPut: $>
