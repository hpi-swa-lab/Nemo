*TypeInference
concreteType
	| relatedNode |
	
	relatedNode :=  TiSystem current compiler analyzeBlock: self decompile.
	
	^ TiSystem current 
		addType: (self class concreteTypeClass new setBlockNode: relatedNode)
