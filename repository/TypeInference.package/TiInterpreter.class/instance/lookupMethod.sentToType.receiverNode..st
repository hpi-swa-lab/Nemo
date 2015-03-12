sending messages
lookupMethod: selector sentToType: receiverType receiverNode: receiverNode
	| startClass |
	startClass := receiverNode isNodeSuper
				ifTrue: [receiverNode methodClass superclass]
				ifFalse: [receiverType exactClass].
	^ self 
		lookupMethod: selector 
		sentToType: receiverType 
		startingFromClass: startClass
