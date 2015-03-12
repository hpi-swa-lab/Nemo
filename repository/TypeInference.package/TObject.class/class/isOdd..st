examples
isOdd: anObject
	"
	TObject isOdd: 1
	TObject isOdd: 2 
	"
	| x isOdd |
	x := anObject.
	isOdd := x odd.
	x := 'bye'.
	^ isOdd
