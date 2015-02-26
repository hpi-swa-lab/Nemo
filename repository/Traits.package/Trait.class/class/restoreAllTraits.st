load-unload
restoreAllTraits		"Trait restoreAllTraits"
	"Restores traits that had been previously removed.
	This is the inverse operation to removeAllTraits."
	| classes |
	classes := Smalltalk allClasses select:[:aClass| aClass includesSelector: #traitInfo].
	classes do:[:aClass| | method |
		method := aClass compiledMethodAt: #traitInfo.
		(method pragmaAt: #traitDefinition:) ifNotNil:[:pragma| 
			pragma arguments first
				ifTrue:[self convertClassToTrait: aClass]].
	] displayingProgress:[:aClass| 'Creating trait ', aClass name].
	classes := Smalltalk allClassesAndTraits select:[:aClass| 
		(aClass includesSelector: #traitInfo) 
			or:[aClass classSide includesSelector: #traitInfo]].
	classes do:[:aClass|
		self restoreCompositionOf: aClass.
		self restoreCompositionOf: aClass classSide.
	] displayingProgress:[:aClass| 'Updating ', aClass name].
