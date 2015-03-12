type propagation
evaluateWith: argTypesArray
	^ evaluations at: argTypesArray
		ifAbsentPut: 
			[ 
				(definition veryDeepCopyWithContext: ContextualDeepCopier block) seedArguments: argTypesArray
			]
	
	