public
newTraitNamed: aSymbol uses: aTraitCompositionOrCollection category: aString
	"Creates a new trait."
	| env |
	env := self environment.
	^self
		named: aSymbol
		uses: aTraitCompositionOrCollection
		category: aString
		env: env