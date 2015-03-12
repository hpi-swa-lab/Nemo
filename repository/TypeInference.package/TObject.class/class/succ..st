blocks
succ: anObject
	"
	TObject succ:  1
	(TObject succ: 1.0) + 1.0 
	"
	^ [:x | x + 1] value: anObject