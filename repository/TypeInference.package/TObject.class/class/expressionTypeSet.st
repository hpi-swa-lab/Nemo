examples
expressionTypeSet
	"
	TObject expressionTypeSet
	"
	| x |
	x := SharedTObject = nil ifTrue: [3] ifFalse: [3.1416].
	^ x
