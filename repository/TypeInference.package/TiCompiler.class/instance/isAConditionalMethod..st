nodes
isAConditionalMethod: aSelector
	| conditionals | 
	
	conditionals := 
	{
		#ifTrue: -> true.
		#ifFalse: -> true.
		#ifTrue:ifFalse: -> true .
		#ifFalse:ifTrue: -> true .
"		#whileTrue: -> true.
		#whileFalse: -> true ."
		#ifNil: -> true.
		#ifNotNil: -> true.
		#ifNil:ifNotNil: -> true. 
		#ifNotNil:ifNil -> true.
	} as: Dictionary.
	^ conditionals at:aSelector ifAbsent:[ false ].
	
