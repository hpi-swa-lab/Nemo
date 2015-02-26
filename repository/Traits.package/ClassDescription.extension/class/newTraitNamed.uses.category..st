*Traits
newTraitNamed: aSymbol uses: aTraitCompositionOrCollection category: aString
	"Creates a new trait. If no current trait implementation
	is installed, raise an error."
	^TraitImpl 
		ifNil:[self error: 'Traits are not installed'] 
		ifNotNil:[TraitImpl newTraitNamed: aSymbol uses: aTraitCompositionOrCollection category: aString]