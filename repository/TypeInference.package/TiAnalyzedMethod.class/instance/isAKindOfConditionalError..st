type propagation
isAKindOfConditionalError: rcvrType 

	"If im not in a conditional context, is false "
	self conditionalContext ifFalse: [ ^false ].
	"Error message cannot be overriden, so is an error management "	
	selector = #error: ifTrue:[ ^true].
	"if is not a common error selector is false"
	(selector = #signal or: [ selector = #signal: ]) ifFalse: [ ^false ].
	"if is an exception subclass is true is an error in a conditional context "
	(rcvrType isOfClassOrSubClass: Exception) ifTrue: [^true].

	
	^false.
	 
