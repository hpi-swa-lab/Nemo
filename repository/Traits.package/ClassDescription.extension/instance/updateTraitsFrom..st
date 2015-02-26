*Traits-NanoKernel
updateTraitsFrom: instanceTraits
	"ClassTrait/Metaclass only. Update me from the given instance traits"
	| map newTraits |
	self isMeta ifFalse:[self error: 'This is a metaclass operation'].
	map := Dictionary new.
	self traitComposition do:[:composed| map at: composed trait put: composed].
	newTraits := (instanceTraits collect:[:composed| | trait |
		trait := composed trait classTrait.
		map at: trait ifAbsent:[trait]] 
	), (self traitComposition select:[:comp| comp trait isBaseTrait]).

	self installTraitsFrom: newTraits