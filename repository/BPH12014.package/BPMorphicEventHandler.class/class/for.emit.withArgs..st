as yet unclassified
for: aMorph emit: anEventSymbol withArgs: anOrderedCollection

	((self dictionary at: aMorph ifAbsent: [ ^ true ])
		at: anEventSymbol ifAbsent: [ ^ true ])
			do: [ :aBlock |
				((aBlock valueWithArguments: anOrderedCollection asArray)
					= false) ifTrue: [ ^ false ].
			].
	^ true