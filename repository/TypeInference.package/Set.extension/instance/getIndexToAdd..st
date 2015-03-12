*TypeInference
getIndexToAdd: newObject
	newObject ifNil: [self error: 'Sets cannot meaningfully contain nil as an element'].
	^ self findElementOrNil: newObject