*TypeInference
mirrorIn: contextBuilder
	^ contextBuilder 
		buildMethod: self selector 
		arguments: arguments
		temporaries: temporaries
		block: block
		primitive: primitive
		precedence: precedence
