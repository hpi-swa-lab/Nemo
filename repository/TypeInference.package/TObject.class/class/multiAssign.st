returns
multiAssign
	"TObject new multiAssign" 
	| t1 |
	t1 := 5.
	self randomBoolean.
	t1 := (self randomBoolean 
			ifTrue: [1]
			ifFalse: [-1]).
	t1 :=  (self randomBoolean 
			ifTrue: [self returnTrue]
			ifFalse: [false]).
	^ t1