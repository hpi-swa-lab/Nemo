building
createResultReceiver: receiverSet arguments: argumentArray return: returnTypeSet
	^ TiPrimitiveResult new
		setReceiver: receiverSet
		arguments: argumentArray
		return: returnTypeSet