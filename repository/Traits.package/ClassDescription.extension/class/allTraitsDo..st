*Traits
allTraitsDo: aBlock
	"Evaluate aBlock with all the instance and class traits present in the system"
	TraitImpl ifNotNil:[TraitImpl allTraitsDo: aBlock].