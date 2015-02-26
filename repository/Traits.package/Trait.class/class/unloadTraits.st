load-unload
unloadTraits
	"Trait unloadTraits"
	Trait traitImpl == self ifTrue:[Trait traitImpl: nil].
	self removeAllTraits.
	Behavior compileSilently: 'updateTraits' classified: 'accessing'.
	ClassDescription removeSelectorSilently: #updateTraits.
	ClassOrganizer organization classify: #traitComposition under: 'accessing'.
	(MCPackage named: 'Traits') unload.
	ClassOrganizer removeSelectorSilently: #traitComposition.
	Behavior removeSelectorSilently: #updateTraits.
	Compiler recompileAll.