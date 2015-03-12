as yet unclassified
causedBy: aType in: aSelector with:argumentsArray resulting: aTypeCuttedFromTree with: argumentsOfCuttedTypeMessage using: anHeuristic
	| instance | 
	instance := self new.
	instance causeType: aType.
	instance causeMessage: aSelector.
	instance messageArguments: argumentsArray.
	instance cuttedType: aTypeCuttedFromTree.
	instance heuristic: anHeuristic.
	instance arguments: argumentsOfCuttedTypeMessage.
	^instance.