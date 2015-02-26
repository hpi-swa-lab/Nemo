load-unload
restoreCompositionOf: aClass
	"Restore the trait composition for the given class"
	| method requires composition |
	method := aClass compiledMethodAt: #traitInfo ifAbsent:[^self].
	aClass removeSelector: #traitInfo.
	requires := (method pragmaAt: #traitRequires:) 
		ifNil:[#()]
		ifNotNil:[:pragma| pragma arguments first].
	(requires allSatisfy:[:tn| (Smalltalk at: tn ifAbsent:[nil]) isKindOf: Trait])
		ifFalse:[^self inform: 'Cannot restore composition of ', aClass name].
	composition := (method pragmaAt: #traitComposition:) 
		ifNil:[^self]
		ifNotNil:[:pragma| Compiler evaluate: pragma arguments first].
	aClass uses: composition.
	aClass traitComposition selectorsAndMethodsDo:[:sel :meth|
		| oldMethod newMethod |
		newMethod := meth methodHome compiledMethodAt: sel.
		oldMethod := aClass compiledMethodAt: sel ifAbsent:[newMethod].
		oldMethod timeStamp = newMethod timeStamp
				ifTrue:[aClass removeSelector: sel]].