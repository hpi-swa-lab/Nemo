guessing types
guessingTypes

	^ IdentityDictionary newFrom: {
		"[guessing type] -> ([display string] [isCertain])"
		#variableName -> #('variable name' false).
		#bindings -> #('binding' true).
		#globalVariable -> #('global variable' true).
		#messageCallScanning -> #('scanning message calls' false).
		#self -> #('keyword self' true).
		#selfClass -> #('self class' true).
		#literal -> #('literal type' true).
		#super -> #('keyword super' true).
		#methodReturnType -> #('method return type' true)
	}