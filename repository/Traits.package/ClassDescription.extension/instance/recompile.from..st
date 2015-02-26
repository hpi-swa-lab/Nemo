*Traits-NanoKernel
recompile: selector from: oldClass
	"Preserve the originalTraitMethod (if any) after recompiling a selector"
	| oldMethod |
	oldMethod := oldClass compiledMethodAt: selector.
	super recompile: selector from: oldClass.
	oldMethod originalTraitMethod ifNotNil:[:traitMethod|
		(self compiledMethodAt: selector) originalTraitMethod: traitMethod.
	].
