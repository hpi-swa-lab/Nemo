variables
instanceVariable: aSymbol  with: aContextBuilder 
	self assertContext: aContextBuilder.
	
	^ aContextBuilder storeVariable: aSymbol definedBy: [
			TiInstanceVariable new
				setName: aSymbol
				receiver: (self nodeSelfWith: aContextBuilder ).
		]