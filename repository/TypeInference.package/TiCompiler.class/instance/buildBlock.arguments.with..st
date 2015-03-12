nodes
buildBlock: statements arguments: args with: aContextBuilder 
	self assertContext: aContextBuilder.
	
	^TiBlockNode new setAnalyzedBlock: 
			(TiAnalyzedBlock new
				definition: (TiBlockDefinitionNode new
					setArguments: (aContextBuilder mirrorArguments: args)
					statements: (aContextBuilder mirrorAll: statements ))).
	