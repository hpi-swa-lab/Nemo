find a constant
arraySelect
	"Test for    data1 select: [ele | ele isArray ]
	MethodFinder methodFor: { #((5 (size) 'stuff' #size ('d')) ).  #((size)  ('d')) }  
	MethodFinder methodFor: { {#(5 (size) 'stuff' #size ('d')). Array}.  #((size)  ('d')) }  
	MethodFinder methodFor: { {17.  #(5 (size) 'stuff' #size ('d')). Array}.  #((size)  ('d')) }  
"
	| rec ans bigExpr expr res2 coll expr2 |
	(rec := (thisData at: 1) at: 1) isSequenceable ifFalse: [^ false].
	(ans := answers at: 1) isSequenceable ifFalse: [^ false].
	(rec size >= ans size ) ifFalse: [^ false].

	"have data = #(( (1 2 3) )). answers = #(('one' 'two' 'three')).  want to find a method for data = 3.  answer = 'three'.  combine all first args from all examples into one big test.  data = ( (1) (2) (3) (10) (11) )  and answers for each."
	thisData with: answers do: [:argArray :anAns |
		"Treat the collection as separate cases"
		anAns isSequenceable ifFalse: [^ false].
		(coll := argArray first) isSequenceable ifFalse: [^ false].
		coll size >= anAns size ifFalse: [^ false].
		].
	res2 := (MethodFinder new loadData: (self expandArg1 ifNil: [^ false])
				answers: (self expandBoolean ifNil: [^ false])) searchForOne.
	res2 isEmpty ifTrue: [^ false].
	expr := res2 first second.
	expr2 := expr copyReplaceAll: 'data1' with: 'ele'.
	2 to: (thisData at: 1) size "is same now" do:[:ii |
		expr2 := expr2 copyReplaceAll: 'data', ii printString with: 'dZZZ', (argMap at: ii) printString].
	expr2 := expr2 copyReplaceAll: 'dZZZ' with: 'data'.
	bigExpr := self newData1, ' select: [ :ele | ', expr2, ' ]'.
	resultsList add: { #select:.  bigExpr.  (thisData at: 1) }.
	^ true.
