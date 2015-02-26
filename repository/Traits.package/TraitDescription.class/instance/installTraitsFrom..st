operations
installTraitsFrom: aTraitComposition
	super installTraitsFrom: aTraitComposition.
	self users do:[:each| each updateTraits].