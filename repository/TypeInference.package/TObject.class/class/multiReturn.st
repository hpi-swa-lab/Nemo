returns
multiReturn
	"
	TObject multiReturn 
	" 
	| t1 |
	t1 := 5.
	t1 = 0 ifTrue: [^ self returnNil].
	t1 = 1 ifTrue: [^ self returnOne].
	t1 = 2 ifTrue: [^ self returnTrue].
	^ self 