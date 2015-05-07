*Nemo-UI
emit: anEventSymbol withArgs: anOrderedCollection

	(self eventProperty at: anEventSymbol ifAbsentPut: [OrderedCollection new.])
		do: [ :aBlock |
			((aBlock valueWithArguments: anOrderedCollection asArray)
				= false) ifTrue: [ ^ false ].
		].
	^ self owner ifNotNilDo: [ :owner | owner emit: anEventSymbol withArgs: anOrderedCollection ]