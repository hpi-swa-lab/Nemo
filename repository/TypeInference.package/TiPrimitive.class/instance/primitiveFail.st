error handling
primitiveFail
	self debug:[ 'primitive ', thisContext sender selector, ' hasFailed '].
	^ TiPrimitiveResult new 
		setReceiver: self receiverTypeSet
		arguments: self argumentTypeSets
		return: Set new;
		setSuccessFlag: false
		
