constructors
receptor: aReceptorType selector: aSelector arguments: anArgumentsArray method:anAnalyzedMethod sender: aSender senderSelector: otherSelector senderArguments:  anArray 
	| instance | 
	aSelector ifNil: [ self halt.].
	instance := self new.
	instance receptor: aReceptorType;
			  selector: aSelector;
			  arguments: anArgumentsArray;
			  method: anAnalyzedMethod;
			  sender: aSender;
			  senderSelector: otherSelector;
			  senderArguments: anArray.
	^instance.