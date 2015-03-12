inference
infere: expression usingForSelf: anObject
	|result |
	TiPrimitive initialize.
	TiSystem current reset.
	result := Compiler new analyze: expression  in:  nil to: anObject notifying: nil ifFail:[ :fail | self error: fail].
	^result.