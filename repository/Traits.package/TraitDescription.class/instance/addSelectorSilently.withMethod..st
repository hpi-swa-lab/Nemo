operations
addSelectorSilently: selector withMethod: compiledMethod
	"Overridden to update the users of this trait"
	super addSelectorSilently: selector withMethod: compiledMethod.
	self users do:[:each| each updateTraits].