blocks
blockWithArgumentValue
	"TObject new blockWithArgumentValue"
	| a block |
	a := 1.0.
	block := [:arg | a := arg].
	block value: #hello.
	block value: 'bye'.
	^ a 