find a constant
arrayCollect
	"Test for    data1 collect: [ele | ele threeDigitName ]
	MethodFinder methodFor: { #((1 2 3)). #('one' 'two' 'three') }
	MethodFinder methodFor: { #(17 (1 2 3)). #('one' 'two' 'three') }
"
	| rec ans bigExpr expr res2 coll |
	(rec := (thisData at: 1) at: 1) isSequenceable ifFalse: [^ false].
	(ans := answers at: 1) isSequenceable ifFalse: [^ false].
	(rec size = ans size ) ifFalse: [^ false].

	"have data = #(( (1 2 3)  (10 11) )). answers = #(('one' 'two' 'three') ('ten' 'eleven')).  want to find a method for data = 3.  answer = 'three'.  combine all first args from all examples into one big test.  data = ( (1) (2) (3) (10) (11) )  and answers for each."
	thisData with: answers do: [:argArray :anAns |
		"Treat the collection as separate cases"
		anAns isSequenceable ifFalse: [^ false].
		(coll := argArray first) isSequenceable ifFalse: [^ false].
		coll size = anAns size ifFalse: [^ false].
		].
	res2 := (MethodFinder new loadData: (self expandArg1 ifNil: [^ false])
				answers: (self expandAnswers ifNil: [^ false])) searchForOne.
	res2 isEmpty ifTrue: [^ false].
	expr := res2 first second.
	bigExpr := self newData1, ' collect: [ :ele | ', (expr copyReplaceAll: 'data1' with: 'ele'), ' ]'.
	resultsList add: { #collect:.  bigExpr.  (thisData at: 1) }.
	^ true.
