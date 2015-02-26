*Traits-NanoKernel
traits
	"Answer an array of my traits"
	^self traitComposition asArray collect:[:composed| composed trait]