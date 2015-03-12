accessing
mergeWith: aPrimitiveResult
	self debugSender.
	aPrimitiveResult isEmptyResult ifTrue: [^ self].
	return addAll: aPrimitiveResult return.
	receiver addAll: aPrimitiveResult receiver.
	arguments with: aPrimitiveResult arguments
		do: [:arg :anotherArg | arg addAll: anotherArg]
