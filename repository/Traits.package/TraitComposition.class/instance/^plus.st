converting
+ aTrait
	self traitsDo:[:t| (t == aTrait trait) ifTrue:[^TraitCompositionException
			signal: 'Trait ' , aTrait trait asString, ' already in composition']].
	self addLast: aTrait.
	^self