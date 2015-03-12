accessing stack
stackContextOf: anlyzedMethod
	| amIdx realIndex  sender senderSelector senderArguments  receptor selector arguments |
	
	amIdx := analyzedMethodStack indexOf: anlyzedMethod.
	(amIdx = 1 or: (amIdx = 0)) ifTrue:[ ^nil ].
	(amIdx = 0 and: (analyzedMethodStack size > 0) ) ifTrue: [ 
		realIndex := analyzedMethodStack size
	] ifFalse: [
		realIndex := amIdx - 1.
	].
		
	sender := receiverStack at:realIndex.
	senderSelector := selectorStack at:realIndex.
	senderArguments  := argumentsStack at:realIndex.

	receptor := receiverStack at:amIdx .
	selector := selectorStack at:amIdx .
	arguments := selectorStack at:amIdx .
		
	^	StackData  receptor: receptor selector: selector arguments:  arguments method: anlyzedMethod sender: sender  senderSelector: senderSelector senderArguments: senderArguments.
	