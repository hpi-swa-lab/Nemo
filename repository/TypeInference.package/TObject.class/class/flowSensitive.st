examples
flowSensitive
	"
	TObject flowSensitive
	"
	| x xIsOdd |
	x := 1.
	xIsOdd := x odd.
	x := 'bye'.
	^ xIsOdd
