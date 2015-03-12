blocks fundamentals
twoBlocks
	"TObject new twoBlocks"
	| t1 t2 t3 |
	t2 := 5.
	t1 := [:t4 | t4 + t2].
	t3 := [:t5 | t5 + t2].
	t1 value: 1.
	t3 value: 1073741823.

