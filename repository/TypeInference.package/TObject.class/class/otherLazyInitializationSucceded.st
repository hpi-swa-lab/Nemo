blocks
otherLazyInitializationSucceded
	| t1 |
	t1 == nil ifTrue: [t1 := #hello].
	^ t1