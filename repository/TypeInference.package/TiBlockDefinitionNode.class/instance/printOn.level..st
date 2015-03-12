printing
printOn: aStream level: level
	statements size <= 1 ifFalse: [aStream crtab: level].
	aStream nextPut: $[.
	self printArgumentsOn: aStream level: level.
	self printStatementsOn: aStream level: level.
	aStream nextPut: $]