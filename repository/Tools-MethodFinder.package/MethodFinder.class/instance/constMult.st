find a constant
constMult
	| const |
	"See if (data1 * C) is the answer
	MethodFinder methodFor: #( (4) 16  (12) 48  (5) 20)
"

	((thisData at: 1) at: 1) = 0 ifTrue: [^ false].
	const _ ((answers at: 1) asFloat / ((thisData at: 1) at: 1)) reduce.
	(self testSel: #* aditionalArg: const) ifFalse: [^ false]. 

	"replace data2 with const in expressions"
	resultsList add: { #*.   self newData1, ' * ', const printString.  (thisData at: 1), {const} }.
	^ true