find a constant
expandBoolean
	"Make a mask for the elements of a collection in arg1 that tells which of them appear in the answer.  Want to find a method that returns true for the elements that appear in the answer.  Creat a mask.  Must match each element to the next answer, or insert false for it..
	Have data = #( ((1 2 3)) ((10 11)) ). answers = #((1 3) (11)).  
	We return 	(true false true   false true).  "
	| ans2 coll ansCol thisAns yes ansCnt |

	ans2 := OrderedCollection new.
	ansCnt := 0.
	thisData with: answers do: [:argArray :anAns |
		"Treat the collection as separate cases"
		anAns isSequenceable ifFalse: [^ nil].
		(coll := argArray first) isSequenceable ifFalse: [^ nil].
		coll size >= anAns size ifFalse: [^ nil].
		anAns size > 0 ifFalse: [^ nil].
		ansCnt := ansCnt + anAns size.

		ansCol := anAns asOrderedCollection.
		ansCol addLast: Float nan.		"not close to anything!"
		thisAns := ansCol removeFirst.
		coll do: [:ele | 
			ans2 addLast: (yes := ele closeToSafe: thisAns).
			yes ifTrue: [thisAns := ansCol removeFirst]]].
	ansCnt = (ans2 count: [:xx | xx]) "number of trues" ifFalse: [^ nil].
			"in case data1 was mangled"
	^  ans2