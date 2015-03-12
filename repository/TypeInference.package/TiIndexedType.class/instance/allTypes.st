accessing
allTypes
	indexedVarTypes isNil ifTrue: [self mutate].
	^ indexedVarTypes