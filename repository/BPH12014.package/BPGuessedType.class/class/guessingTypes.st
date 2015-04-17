guessing types
guessingTypes

	^ IdentityDictionary newFrom: {
		#variableName -> #('variable name' false).
		#bindings -> #('binding' true).
		#globalVariable -> #('global variable' true).
		#messageCallScanning -> #('scanning message calls' false).
		#selfClass -> #('keyword self' true).
		#literal -> #('literal type' true).
	}