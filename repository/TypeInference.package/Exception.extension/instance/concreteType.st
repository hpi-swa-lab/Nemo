*TypeInference
concreteType
	^ TiExceptionType new 
		setException: self 
		sharedType: (TiSystem current 
						addType: (self class concreteTypeClass new setObject: self))
