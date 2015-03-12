as yet unclassified
emptyResult: rcvrType with: argTypes using:anHeuristic for: anAnalyzedMethod
	| result  stackData |
	stackData  := anAnalyzedMethod stackContext.
	"anAnalyzedMethod assert: [ stackData receptor = rcvrType or: [ (rcvrType isOfClassOrSubClass: stackData receptor exactClass ) or: [ rcvrType exactClass = ProtoObject ]]]."
	 result := self causedBy: stackData sender in: stackData senderSelector with: stackData senderArguments resulting: rcvrType with: argTypes using: anHeuristic.
	^result.   