type propagation
seedReceiver: rcvrType arguments: argTypes
	self debugSender.

	receiver seedInitial: rcvrType.
	arguments with: argTypes do: [
		:arg :type | 
		arg seedInitial: type
	].
	^ TiMessageResult new
						setReceiver: self receiverTypeSet 
						arguments: self argumentTypeSets
						return: self typeSet.