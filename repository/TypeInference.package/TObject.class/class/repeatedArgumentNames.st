blocks fundamentals
repeatedArgumentNames
	"TObject new repeatedArgumentNames"
	| t1 |
	t1 := [:t2 | t2] value: 1.0.
	t1 := [:t2 | t2] value: #hello.
	^ t1
	



