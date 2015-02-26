monticello
asMCDefinition
	^Smalltalk at: #MCClassTraitDefinition ifPresent:[:aClass|
		aClass
			baseTraitName: self baseTrait name
			classTraitComposition: self traitCompositionString
	].