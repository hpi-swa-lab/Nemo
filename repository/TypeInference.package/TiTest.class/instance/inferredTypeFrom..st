tests
inferredTypeFrom: aString

	| result |
	TiSystem current reset. 
	result := Compiler new analyze: aString in: nil to: nil notifying: nil ifFail: [1].
	^result 