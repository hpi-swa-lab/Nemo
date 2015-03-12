blocks
assignementInsideBlock
	"
	TObject assignementInsideBlock
	"
	| t1 | 
	t1 := 1.0.
	self randomBoolean 
		ifTrue: [t1 := #hello. t1 := 'bye'].
	^ t1
