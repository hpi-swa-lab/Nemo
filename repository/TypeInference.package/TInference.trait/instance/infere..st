inference
infere: expression 
	|result |
	TiPrimitive initialize.
	TiSystem current reset.
	result := Compiler new analyze: expression  in:  nil to: nil notifying: nil ifFail:[ :fail | self error: fail].
	^result.