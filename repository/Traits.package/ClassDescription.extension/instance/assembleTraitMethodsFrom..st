*Traits-NanoKernel
assembleTraitMethodsFrom: aTraitComposition
	"Assemble the resulting methods for installing the given trait composition.
	Returns a Dictionary instead of a MethodDictionary for speed (MDs grow by #become:)"
	| methods |
	methods := Dictionary new.
	"Stick in the local methods first, since this avoids generating conflict methods unnecessarily"
	self selectorsAndMethodsDo:[:sel :newMethod|
		(self isLocalMethod: newMethod)
			ifTrue:[methods at: sel put:newMethod]].
	"Now assemble the traits methods"
	aTraitComposition do:[:trait|
		trait selectorsAndMethodsDo:[:sel :newMethod| | oldMethod |
			oldMethod := methods at: sel ifAbsentPut:[newMethod].
			newMethod == oldMethod ifFalse:["a conflict"
				(self isLocalMethod: oldMethod) ifFalse:[
					methods at: sel put: (self resolveTraitsConflict: sel from: oldMethod to: newMethod)]]]].
	^methods