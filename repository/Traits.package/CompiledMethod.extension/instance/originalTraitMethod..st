*Traits-NanoKernel
originalTraitMethod: aCompiledMethod
	"Remember the original trait method for the receiver."
	| methodState |
	methodState := TraitMethodState newFrom: self properties.
	methodState originalTraitMethod: aCompiledMethod.
	self penultimateLiteral:  methodState.