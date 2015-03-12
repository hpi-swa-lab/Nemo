object access primitives
primitiveClone
	^ self createResult addReturn: self receiver exactClass createType
