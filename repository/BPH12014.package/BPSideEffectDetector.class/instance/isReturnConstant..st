quick-testing
isReturnConstant: aMethodReference
	| stream |
	stream := (InstructionStream on: self).
	aMethodReference 
	