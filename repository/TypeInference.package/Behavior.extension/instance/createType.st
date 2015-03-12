*TypeInference
createType
	^ TiSystem current 
		addType: (self concreteTypeClass new setClass: self)