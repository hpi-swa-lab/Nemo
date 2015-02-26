*Traits-NanoKernel
installTraitMethodDict: methods
	"After having assembled the trait composition, install its methods."
	| oldCategories removals |
	"Apply the changes. We first add the new or changed methods."
	oldCategories := Set new.
	methods keysAndValuesDo:[:sel :newMethod| | oldMethod |
		oldMethod := self compiledMethodAt: sel ifAbsent:[nil].
		oldMethod == newMethod ifFalse:[
			self traitAddSelector: sel withMethod: newMethod.
			(self organization categoryOfElement: sel) ifNotNil:[:cat| oldCategories add: cat].
			self organization classify: sel under: 
				(newMethod methodHome organization categoryOfElement: newMethod selector)]].

	"Now remove the old or obsoleted ones"
	removals := OrderedCollection new.
	self selectorsDo:[:sel| (methods includesKey: sel) ifFalse:[removals add: sel]].
	removals do:[:sel| self traitRemoveSelector: sel].

	"Clean out empty categories"
	oldCategories do:[:cat|
		(self organization isEmptyCategoryNamed: cat)
			ifTrue:[self organization removeCategory: cat]].

