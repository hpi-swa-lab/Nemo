type propagation
seedArguments: argTypesArray
	arguments with: argTypesArray 
		do: [:arg :type | arg seedInitial: type].
	^ TiBlockResult new
		setNonLocalReturn: slot typeSet
		arguments: self argumentTypeSets
		return: statements last typeSet
