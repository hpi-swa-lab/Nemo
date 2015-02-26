*Traits-NanoKernel
allTraits
	"Answer all the traits that are used by myself without their transformations"
	^self traitComposition isEmpty 
		ifTrue:[#()]
		ifFalse:[self traitComposition allTraits].