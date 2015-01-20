find a constant
constDiv
	| const got |
	"See if (data1 // C) is the answer.  // Truncates the answer.
	MethodFinder methodFor: #( (3 7) 3  (10 7) 5  (25 5) 10)
"
	(answers at: 1) = 0 ifTrue: [^ false].
	const _ ((thisData at: 1) at: 1) // (answers at: 1).  "May not be right!"
	got := false.
	(self testSel: #// aditionalArg: const) ifTrue: [
		"replace data2 with const in expressions"
		resultsList add: { #//.   self newData1, ' // ', const printString.  (thisData at: 1), {const} }.
		got := true].
	(self testSel: #quo: aditionalArg: const) ifTrue: [
		"replace data2 with const in expressions"
		resultsList add: { #quo:.   self newData1, ' quo: ', const printString.  (thisData at: 1), {const} }.
		got := true].
	^ got