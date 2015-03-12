building
setReceiver: receiverExpr
	receiver := receiverExpr.
	receiver isVariableNode 
		ifTrue: [temporaryVariable := receiver]
		ifFalse: [temporaryVariable := TiRegularVariable new setName: #temp.
				receiver connectTo: temporaryVariable currentSlot]
				

