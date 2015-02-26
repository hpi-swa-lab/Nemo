*Traits-NanoKernel
isLocalMethod: aCompiledMethod
	"Answer true if the method is a local method, e.g., defined in the receiver instead of a trait."
	^aCompiledMethod methodHome == self