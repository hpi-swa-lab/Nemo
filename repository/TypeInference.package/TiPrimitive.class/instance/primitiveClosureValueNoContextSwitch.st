control primitives
primitiveClosureValueNoContextSwitch
	|  result |
	^ (receiver isBlock 
	and: [arguments size = receiver argumentCount])
		ifTrue: 
			[result := receiver evaluateWith: arguments.
			receiver seedNonLocalReturn: result nonLocalReturn.
			self
				createResultReceiver: self receiverTypeSet
				arguments: result arguments
				return: result return]
		ifFalse:[self primitiveFail]
