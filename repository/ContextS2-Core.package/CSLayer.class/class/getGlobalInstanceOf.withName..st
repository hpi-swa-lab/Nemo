private
getGlobalInstanceOf: aClass withName: aSymbol
	
	^ (Smalltalk includesKey: aSymbol)
		ifTrue: [ | layer |
			layer := Smalltalk at: aSymbol.
			(layer isKindOf: CSLayer)
				ifTrue: [
					layer class == aClass
						ifTrue: [ layer ]
						ifFalse: [ "Delete obsolete CSLayer instances. Kind of a side case, but keeps the system clean."
							Smalltalk removeKey: aSymbol.
							self getGlobalInstanceOf: aClass withName: aSymbol ] ]
				ifFalse: [ self error: 'Global ', aSymbol, ' already exists, cannot create layer with that name.' ] ]
		ifFalse: [
			Smalltalk at: aSymbol put: (aClass basicNew initialize: aSymbol; yourself) ] "Avoid #new"