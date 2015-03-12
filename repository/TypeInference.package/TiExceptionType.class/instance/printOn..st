as yet unclassified
printOn: aStream
	aStream 
		nextPut: $<;
		print: exception ;
		nextPut: $>
