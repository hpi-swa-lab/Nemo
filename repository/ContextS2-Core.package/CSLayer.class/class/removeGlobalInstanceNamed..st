private
removeGlobalInstanceNamed: aSymbol
	
	^ ((Smalltalk at: aSymbol ifAbsent: [ ^ nil ]) isKindOf: CSLayer)
		ifTrue: [ Smalltalk removeKey: aSymbol ]
		ifFalse: [ self error: 'Global ', aSymbol, ' is not an instance of CSLayer' ]