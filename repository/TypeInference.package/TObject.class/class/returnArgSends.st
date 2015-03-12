messages
returnArgSends
	"
	TObject new returnArgSends 
	"
	| t1 |
	t1 := 1.
	self returnArg: t1.
	t1 := #hello.
	^ self returnArg: t1.
	
