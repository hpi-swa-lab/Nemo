blocks
lazyInitializationFailed
	"
	TObject new lazyInitializationFailed
	"
	| t1 |
	t1 := 5.
	t1 isNil ifTrue: [t1 := #hello].
	^ t1