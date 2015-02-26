load-unload
removeAllTraits		"Trait removeAllTraits"
	"Removes all traits currently in use. 
	Preserves enough information so that traits can be recovered."
	| converted remain |
	converted := Set new.
	Smalltalk allClasses do:[:aClass|
		self flattenTraitMethodsInClass: aClass classSide.
		self flattenTraitMethodsInClass: aClass.
		converted add: aClass.
	] displayingProgress: 'Flattening classes'.

	remain := Smalltalk allTraits asSet.
	(1 to: remain size) do:[:i| | trait |
		trait := remain 
			detect:[:any| any users allSatisfy:[:aClass| converted includes: aClass]]
			ifNone:[self error: 'Cyclic traits detected'].
		remain remove: trait.
		self flattenTraitMethodsInClass: trait classSide.
		self flattenTraitMethodsInClass: trait.
		converted add: trait.
	] displayingProgress: 'Flattening traits'.

	"Convert all traits to classes"
	Smalltalk allTraits
		do:[:trait| self convertTraitToClass: trait] 
		displayingProgress:[:trait| 'Converting ', trait name].
