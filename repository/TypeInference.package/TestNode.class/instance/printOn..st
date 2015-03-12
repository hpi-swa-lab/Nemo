as yet unclassified
printOn: aStream
	name printOn: aStream.
	aStream nextPut: $(.
	self hash printOn: aStream.
	aStream nextPut: $).