type propagation
seed: aType fromVariable: aSymbol
	self debug:[ ' applying over ', (previousSlot typeSet collect:#asString) asString ].
	self basicSeedAll: 
		(previousSlot typeSet 
			collect: [:type | type atVariable: aSymbol putType: aType])