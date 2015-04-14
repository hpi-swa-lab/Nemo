quick-testing
isVariableModifying: aMethodReference
	aMethodReference abstractBytecodeMessagesDo:
		[ :msg |
			(#(#popIntoReceiverVariable:
			    #storeIntoReceiverVariable:
			    #popIntoLiteralVariable:) includes: msg selector) ifTrue: [ ^ true ] ].
	^ false