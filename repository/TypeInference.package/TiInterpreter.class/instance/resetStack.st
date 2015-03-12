accessing stack
resetStack
	receiverStack := OrderedCollection new.
	selectorStack := OrderedCollection new.
	argumentsStack := OrderedCollection new.
	analyzedMethodStack := OrderedCollection new.
