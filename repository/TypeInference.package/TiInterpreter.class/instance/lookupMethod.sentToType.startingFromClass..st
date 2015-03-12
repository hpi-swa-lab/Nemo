sending messages
lookupMethod: selector sentToType: receiverType startingFromClass: startClass
	| class |
	
	class := startClass classImplementingSelector: selector.
	
	
	class isNil
		ifTrue: [
				self debug: 'startClass is nil! '.
				self error: startClass printString, ' will not understand #', selector.	
		].
		"bring up something like a Debugger showing the contextStack. 
		If the user chooses to go on with the analysis, create a special
		 type that keeps track of this problem"
	self debug:[ ' starting for class ', class name].
	^ (TiSystem current classAt: class)  analyzedMethodAt: selector calledFromContextOf: (analyzedMethodStack lastOrNil ). 