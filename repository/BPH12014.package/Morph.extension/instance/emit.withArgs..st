*BPH12014-UI
emit: anEventSymbol withArgs: anOrderedCollection

	(BPMorphicEventHandler for: self emit: anEventSymbol withArgs: anOrderedCollection)
		ifFalse: [ ^ false ].
	^ self owner ifNotNilDo: [ :owner | owner emit: anEventSymbol withArgs: anOrderedCollection ]