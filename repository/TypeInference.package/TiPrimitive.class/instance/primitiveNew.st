object access primitives
primitiveNew
	^ self createResult addReturn: self receiver exactClass soleInstance createType
