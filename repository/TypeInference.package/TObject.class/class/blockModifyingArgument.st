blocks fundamentals
blockModifyingArgument
	"
	TObject new blockModifyingArgument
	"
	| t1 |
	t1 := TPoint x: 5 y: 5.
	[:t2 | t2 changeX] value: t1.
	^ t1



