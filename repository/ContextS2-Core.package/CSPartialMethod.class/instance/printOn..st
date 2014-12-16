printing
printOn: aStream
	
	aStream
		nextPutAll: selector;
		nextPutAll: ' ('.
	self isBase
		ifTrue: [ aStream nextPutAll: '<base>' ]
		ifFalse: [ self printLayersOn: aStream ].
	aStream nextPut: $).