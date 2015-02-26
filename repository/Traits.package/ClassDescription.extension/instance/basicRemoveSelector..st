*Traits-NanoKernel
basicRemoveSelector: aSelector
	"Remove the message whose selector is given from the method 
	dictionary of the receiver, if it is there. Update the trait composition."
	| oldMethod |
	oldMethod := super basicRemoveSelector: aSelector.
	oldMethod ifNotNil:[self updateTraits].
	^oldMethod