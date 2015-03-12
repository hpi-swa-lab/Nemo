*TypeInference
addReturningExisting: newObject 
	| index |
	newObject == nil ifTrue: [self error: 'Sets cannot meaningfully contain nil as an element'].
	index := self findElementOrNil: newObject.
	^ (array at: index) == nil 
		ifTrue: [self atNewIndex: index put: newObject. newObject]
		ifFalse: [array at: index].
