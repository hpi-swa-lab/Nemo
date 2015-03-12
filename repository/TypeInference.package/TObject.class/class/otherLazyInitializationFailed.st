blocks
otherLazyInitializationFailed
	| t1 |
	t1 := 5.
	t1 == nil ifTrue: [t1 := #hello. t1 := 'bye'].
	^ t1