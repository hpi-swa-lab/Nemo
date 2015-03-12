cartesian product
argumentTypesArray
	| typesArray |
	typesArray := Array new: arguments size + 1.
	typesArray at: 1 put: receiver typeSet asArray.
	1 to: arguments size 
		do: [:i | typesArray at: i+1 put: (arguments at: i) typeSet asArray].
	^ typesArray