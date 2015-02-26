operations
+ aTrait
	"Creates a composition with the receiver and aTrait"
	aTrait traitsDo:[:t| self == t ifTrue:[TraitCompositionException
			signal: 'Trait ' , self asString, ' already in composition']].
	^TraitComposition withAll: {self}, aTrait asTraitComposition