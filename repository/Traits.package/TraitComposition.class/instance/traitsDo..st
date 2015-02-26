accessing
traitsDo: aBlock
	^self do:[:each| each traitsDo: aBlock]