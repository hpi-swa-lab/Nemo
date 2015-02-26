operations
selectorsAndMethodsDo: aBlock
	"enumerates all selectors and methods in a trait composition"

	subject selectorsAndMethodsDo: aBlock.
	aliases do:[:assoc| | method |
		"Method can be nil during removals"
		method := subject compiledMethodAt: assoc value ifAbsent:[nil].
		method ifNotNil:[aBlock value: assoc key value: method].
	].