find a constant
constAllTheSame
	| const |
	"See if (^ constant) is the answer
	MethodFinder methodFor: #((7) 2   (4) 2 )
	"

	"quick test"
	((const := answers at: 1) closeToSafe: (answers at: 2)) ifFalse: [^ false].
	3 to: answers size do: [:ii | (const closeToSafe: (answers at: ii)) ifFalse: [^ false]].
	resultsList add: { #yourself.   '^ ', const printString.  {const} }.
	^ true