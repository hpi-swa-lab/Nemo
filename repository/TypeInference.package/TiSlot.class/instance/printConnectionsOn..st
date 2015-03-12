printing
printConnectionsOn: aStream
	connections isEmptyOrNil ifTrue: [^ self].
	aStream nextPutAll: '=>'.
	connections do: [:each | aStream nextPutAll: each identityHashPrintString]
