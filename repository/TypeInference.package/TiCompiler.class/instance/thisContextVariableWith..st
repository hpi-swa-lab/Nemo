variables
thisContextVariableWith: aContextBuilder 
	self assertContext: aContextBuilder.
	
	^ aContextBuilder storeVariable: #thisContext definedBy: [
			TiRegularVariable new
				setName: #thisContext;
				seedInitial: aContextBuilder analyzedMethod methodContext concreteType.
		]