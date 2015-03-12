building
createResult
	^self createResultReceiver: self receiverTypeSet
				arguments: self argumentTypeSets
				return: (Set new:2)