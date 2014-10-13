arg maps
permuteArgs
	self numberOfArgsPerTuple <= 1
		ifTrue: [^ false].
	mapList
		ifNil: [self generatePermutationsOfInputArguments].
	mapStage := mapStage + 1.
	mapStage > mapList size
		ifTrue: [^ false].
	argMap := mapList at: mapStage.
	self mapData.
	^ true