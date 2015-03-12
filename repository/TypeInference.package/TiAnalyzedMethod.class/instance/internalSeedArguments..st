type propagation
internalSeedArguments: argTypesArray 
	| result rcvrType argTypes definitionCopy |
	rcvrType := argTypesArray at: 1.	
	argTypes := argTypesArray copyFrom: 2 to: argTypesArray size.
	result := self managePossibleErrors: rcvrType with: argTypes.

      result ifNil:[
		 primitive notNil ifTrue: [
				result := primitive setReceiver: rcvrType arguments: argTypes;   try.		
				result isSuccess ifFalse: [
						result := (definition veryDeepCopy seedReceiver: rcvrType arguments: argTypes)	mergeWith: result.
				]
		] ifFalse: [
			result := self manageWeirdCases.
			result ifNil:[	
				self debug:[ 'seeding without primitive '].
				definitionCopy := definition veryDeepCopy.
				result := definitionCopy seedReceiver: rcvrType arguments: argTypes.
			]
		].
	].

	^result.