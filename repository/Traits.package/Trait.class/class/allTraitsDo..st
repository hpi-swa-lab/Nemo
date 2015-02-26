public
allTraitsDo: aBlock
	"Evaluate aBlock with all the instance and class traits present in the system"
	
	Smalltalk allTraitsDo: [ :aTrait |
		aBlock
			value: aTrait instanceSide;
			value: aTrait classSide ]