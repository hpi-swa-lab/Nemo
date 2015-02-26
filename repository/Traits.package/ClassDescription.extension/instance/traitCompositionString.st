*Traits-NanoKernel
traitCompositionString
	"Answer the trait composition string for the receiver"
	^self traitComposition isEmpty 
		ifTrue:['{}'] 
		ifFalse:[self traitComposition asString].