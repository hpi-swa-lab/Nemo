blocks
doubleNestedBlocks
	"
	TObject doubleNestedBlocks
	"
	(1 > 2) 
		ifTrue: 
			[(2 > 3) ifTrue: [^ nil].
			#hello].
	^ 'bye'