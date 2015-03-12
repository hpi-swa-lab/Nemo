*TypeInference
concreteType
	^ TiSystem current 
		addType: (self class concreteTypeClass new setObject: self)
