variables
sharedVariableAt: anObject named: aSymbol with: aContextBuilder 
	self assertContext: aContextBuilder.
	
	^ sharedVariables at: anObject
		ifAbsentPut: [
			TiSharedVariable new
				setName: aSymbol;
				seedInitial: anObject concreteType
		]