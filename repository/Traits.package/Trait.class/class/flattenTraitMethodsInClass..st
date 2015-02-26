load-unload
flattenTraitMethodsInClass: aClass
	"Flatten all the trait methods in the given class"
	
	(aClass isTrait or:[aClass hasTraitComposition]) ifFalse:[^self].
	self storeTraitInfoInClass: aClass.
	aClass selectorsAndMethodsDo:[:sel :meth| | oldClass |
		(aClass includesLocalSelector: sel) ifFalse:[
			oldClass := meth methodHome.
			aClass compile: (aClass sourceCodeAt: sel)
				classified: (aClass organization categoryOfElement: sel)
				withStamp: (oldClass compiledMethodAt: sel ifAbsent:[meth]) timeStamp
				notifying: nil]].
	aClass traitComposition: #().