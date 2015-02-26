accessing
allTraits
	^self gather:[:each| each allTraits copyWith: each trait]