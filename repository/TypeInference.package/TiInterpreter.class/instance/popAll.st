accessing stack
popAll
	| receptor selector arguments anlyzedMethod| 

	arguments := argumentsStack removeLast.
	selector := selectorStack removeLast.
	receptor := receiverStack removeLast.
	anlyzedMethod := analyzedMethodStack removeLast.
	
	self announce: (StackPoped receptor: receptor  selector: selector  arguments:  arguments method: anlyzedMethod sender: (receiverStack lastOrNil) senderSelector: selectorStack lastOrNil senderArguments: argumentsStack lastOrNil).

