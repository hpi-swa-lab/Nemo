*TypeInference
add: newObject ifPresent: aBlock
	| index |
	newObject == nil ifTrue: [self error: 'Sets cannot meaningfully contain nil as an element'].
	index := self findElementOrNil: newObject.
	(array at: index) == nil 
		ifTrue: [self atNewIndex: index put: newObject]
		ifFalse: [aBlock value].
	^ newObject