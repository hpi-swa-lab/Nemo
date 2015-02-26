*Traits-NanoKernel
installTraitsFrom: aTraitComposition
	"Install the traits from the given composition. This method implements
	the core composition method - all others are just optimizations for
	particular cases. Consequently, the optimized versions can always fall
	back to this method when things get too hairy."
	| allTraits methods |

	(self traitComposition isEmpty and: [aTraitComposition isEmpty]) ifTrue: [^self].

	"Check for cycles"
	allTraits := aTraitComposition gather: [:t | t allTraits copyWith: t].
	(allTraits includes: self) ifTrue:[^self error: 'Cyclic trait definition detected'].

	self traitComposition: aTraitComposition.
	methods := self assembleTraitMethodsFrom: aTraitComposition.
	self installTraitMethodDict: methods.
	self isMeta ifFalse:[self classSide updateTraitsFrom: aTraitComposition].
