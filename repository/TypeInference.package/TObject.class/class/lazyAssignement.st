assignements
lazyAssignement
	"TObject new lazyAssignement"
	| t1 |
	t1 := 5.
	t1 isNil ifTrue: [t1 := #hello].
	^ t1