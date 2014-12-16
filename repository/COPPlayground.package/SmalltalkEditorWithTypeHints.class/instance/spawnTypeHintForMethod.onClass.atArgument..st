as yet unclassified
spawnTypeHintForMethod: aMethodSymbol onClass: aClassSymbol atArgument: anInteger

	| typeHintMorph |

	typeHintMorph := TypeHintMorph newWith: (
		(BPH1ParameterTypeTool
			typesForMethod: aMethodSymbol
			onClass: (Smalltalk at: aClassSymbol)
			atArgument: anInteger)
		ifEmpty: [^self] ifNotEmptyDo: [ :typeText |
			typeText.
		]
	).
	typeHintMorph position: (ActiveHand position - 10).
	self replaceTypeHintTextMorphWith: typeHintMorph.