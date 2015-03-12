*TypeInference
createInitializedType: typesArray
	^ TiSystem current 
		addType: (self concreteTypeClass new 
					setClass: self 
					initializedWith: typesArray)