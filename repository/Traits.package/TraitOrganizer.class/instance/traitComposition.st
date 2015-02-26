accessing
traitComposition
	"Answer the receiver's trait composition"
	^traitComposition ifNil:[traitComposition := TraitComposition new]