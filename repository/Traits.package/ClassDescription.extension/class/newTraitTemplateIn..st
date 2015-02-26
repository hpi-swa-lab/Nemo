*Traits
newTraitTemplateIn: categoryString
	^TraitImpl ifNil:[''] ifNotNil:[TraitImpl newTemplateIn: categoryString].