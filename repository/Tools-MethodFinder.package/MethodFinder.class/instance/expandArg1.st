find a constant
expandArg1
	"Extract the elements of a collection in arg1 to look for a method that converts each of them to an element of the answer.  There may be an arg2 that has to be preserved.  
	Have data = #( ((1 2 3)) ((10 11)) ). answers = #(('one' 'two' 'three') ('ten' 'eleven')).  want to find a method to convert 3 into 'three'.  Expand all first arg elements from all examples into one big test.  data = ( (1) (2) (3) (10) (11) )  and answers for each."
	| data2 rest |

	data2 := OrderedCollection new.
	thisData with: answers do: [:argArray :anAns |
		"Treat the collection as separate cases"
		rest := argArray allButFirst.
		argArray first do: [:ele | data2 add: {ele}, rest].
		].
	^  data2 