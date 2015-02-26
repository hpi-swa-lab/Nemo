initialize
uses: aTraitComposition
	| newTraits copyOfOldTrait |
	copyOfOldTrait := self shallowCopy.
	newTraits := aTraitComposition asTraitComposition.
	newTraits traitsDo:[:t|
		(t isBaseTrait and:[t classSide hasMethods]) 
			ifTrue:[self error: 'Cannot add: ', t].
		(t isClassTrait and:[(baseTrait includesTrait: t baseTrait) not]) 
			ifTrue:[self error: 'Cannot add: ', t].
	].
	self installTraitsFrom: newTraits.
	SystemChangeNotifier uniqueInstance
		traitDefinitionChangedFrom: copyOfOldTrait to: self.