nodes
buildMethod: aSelector arguments: args temporaries: temps block: aBlock primitive: primIndex precedence: precedence with: aContextBuilder 
	
	self assertContext: aContextBuilder.
	
	aContextBuilder usePrimitive: primIndex.
	^TiMethodNode new
		setReceiver: (self nodeSelfWith: aContextBuilder )
		arguments: (aContextBuilder mirrorArguments: args)
		temporaries: (aContextBuilder mirrorAll: temps)
		statements: (aContextBuilder mirrorAll: aBlock statements)
		conditional: (self isAConditionalMethod: aSelector)
		precedence: precedence.