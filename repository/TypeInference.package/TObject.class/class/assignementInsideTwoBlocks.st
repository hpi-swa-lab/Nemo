blocks
assignementInsideTwoBlocks
	"
	TObject assignementInsideBlock
	"
	| t1 | 
	t1 := 1.0.
	self randomBoolean 
		ifTrue: [t1 := #hello.] ifFalse: [ t1 := 5555555555555555555555 ].
	^ t1
