find a constant
constPlus
	"See if (data1 + C) is the answer.  Only return (data1 + 3.5), not every selector that works (bitOr:)
	MethodFinder methodFor: #( (4) 14  (0) 10  (13) 23)
	"
	| const |

	const _ (answers at: 1) - ((thisData at: 1) at: 1).
	(self testSel: #+ aditionalArg: const) ifFalse: [^ false]. 

	"replace data2 with const in expressions"
	resultsList add: { #+.   self newData1, ' + ', const printString.  (thisData at: 1), {const} }.
	^ true