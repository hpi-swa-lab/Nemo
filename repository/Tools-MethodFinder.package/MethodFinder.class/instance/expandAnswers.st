find a constant
expandAnswers
	"Extract the elements of a collection in arg1 to look for a method that converts each of them to an element of the answer.  Each Answer is a collection.  Join them al together to have many small answers.  Checking has already been done.
	Have data = #( ((1 2 3)) ((10 11)) ). answers = #(('one' 'two' 'three') ('ten' 'eleven')).  want answers =  #('one' two' three' 'ten' 'eleven')."
	| ans2 |

	ans2 := OrderedCollection new.
	answers do: [:anAnswer | ans2 addAll: anAnswer].  "Join them"
	^ ans2