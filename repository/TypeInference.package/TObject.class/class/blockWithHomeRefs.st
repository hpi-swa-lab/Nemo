blocks fundamentals
blockWithHomeRefs
	| t1 |
	t1 := 5.
	[:t2 | t1 := t2] value: 1.0.
	^ t1
	


