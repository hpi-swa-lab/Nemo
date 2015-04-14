quick-testing
isReturnConstant: aMethodReference
	"| stream |
	stream := (InstructionStream on: aMethodReference).
	aMethodReference ".
	^ false
	