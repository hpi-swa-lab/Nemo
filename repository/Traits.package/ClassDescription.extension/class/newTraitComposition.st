*Traits
newTraitComposition
	"Answer a new trait composition. If no current trait implementation
	is installed, return an empty array"
	^TraitImpl ifNil:[#()] ifNotNil:[TraitImpl newTraitComposition].