*TypeInference
concreteType
	^ TiSymbolType new 
		setSymbol: self 
		sharedType: (TiSystem current 
						addType: (self class concreteTypeClass new setObject: self))
