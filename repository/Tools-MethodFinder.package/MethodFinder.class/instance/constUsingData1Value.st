find a constant
constUsingData1Value
	"(data1 op Const), where const is one of the values of data1"
	" == ~~   ~= =   <= >=   < >
	MethodFinder methodFor: #( (4 ) true  (0 ) true  (6 ) false)
"
	| const |
	"quick test"
	((answers at: 1) class superclass == Boolean) ifFalse: [^ false].
	2 to: answers size do: [:ii | 
		((answers at: ii) class superclass == Boolean) ifFalse: [^ false]].

	thisData do: [:datums | 
		const _ datums first.	"use data1 as the constant for each example presented"
		#( == ~~   ~= =   < >   <= >=) do: [:aSel |
			(self testSel: aSel aditionalArg: const) ifTrue: [
				"replace data2 with const in expressions"
				resultsList add: { aSel.   self newData1, ' ', aSel, ' ', const printString.  (thisData at: 1), {const} }.
				^ true]]].
	^ false