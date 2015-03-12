blocks
lazyInitializationSucceded
	"
	TObject new lazyInitializationSucceded
	"
	| t1 |
	t1 isNil ifTrue: [t1 := #hello].
	^ t1