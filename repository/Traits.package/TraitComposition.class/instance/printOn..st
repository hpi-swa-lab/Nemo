converting
printOn: aStream
	"Answer the trait composition string (used for class definitions)"
	aStream nextPutAll: self traitCompositionString.
