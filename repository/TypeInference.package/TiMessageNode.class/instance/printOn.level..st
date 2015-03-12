printing
printOn: aStream level: level
	"see MessageNode printOn:indent: to do it right..." 
	receiver printOn: aStream .
	aStream space;
		nextPutAll: selector;
		space.
	arguments ifNotNil:[ arguments do: [:each | each printOn: aStream level: level.	aStream space. ]].