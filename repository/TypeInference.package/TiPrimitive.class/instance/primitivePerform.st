control primitives
primitivePerform
	| selectorType messageResult |
	selectorType := arguments first.
	(selectorType exactClass == Symbol) 
		ifFalse: [^ TiPrimitiveResult failed].
	messageResult := TiSystem current interpreter
						sendMessage: selectorType symbol
						withArgs: self messageArguments.
	^ TiPrimitiveResult new
		setReceiver: messageResult receiver
		arguments:  (self argumentTypeSetsFrom: messageResult)
		return: messageResult return