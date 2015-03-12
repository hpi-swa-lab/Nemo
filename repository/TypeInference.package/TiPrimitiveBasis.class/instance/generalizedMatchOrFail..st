type propagation
generalizedMatchOrFail: setOfArraysOfTypes
	"The argument setOfArraysOfTypes is a array containing Arrays, all of which have
	size = receiver argumentCount + 1. Match the receiver and args against the types
	in theArray. nil matches any type. The inner array for which all of the types 
	match is returned, nil ifNone"


	setOfArraysOfTypes do:
		[:anArrayOfTypes |
			({receiver}, 
			arguments	with: anArrayOfTypes allSatisfy: [:anArg :aClass |
					aClass isNil ifTrue:[true] ifFalse:[ anArg isOfClassOrSubClass: aClass]]) ifTrue:[
						self debug:[ thisContext sender selector, ' does match!'].
						^anArrayOfTypes.
					]
			].
	self debug:[ thisContext sender selector, ' does NOT match!'].

	^nil