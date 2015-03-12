printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: 	(self isSuccess 
							ifTrue: [' succeded']
							ifFalse: [' failed'])