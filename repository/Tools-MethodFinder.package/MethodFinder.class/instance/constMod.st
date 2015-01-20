find a constant
constMod
	| low |
	"See if mod, (data1 \\ C) is the answer
	MethodFinder methodFor: #((35) 3   (17) 1   (5) 5)
"

	low := answers max.
	low+1 to: low+20 do: [:const |
		(self testSel: #\\ aditionalArg: const) ifTrue: [
			"replace data2 with const in expressions"
			resultsList add: { #\\.   self newData1, ' \\ ', const printString.  (thisData at: 1), {const} }.
			^ true]].
	^ false