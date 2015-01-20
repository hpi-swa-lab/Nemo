find a constant
constAt
	"Only return (data1 at: C)
	MethodFinder methodFor: { {1 to: 20}. 8.  #('abcdefghijk'). $h.  }
	MethodFinder methodFor: { {true. 1 to: 20}. 8.  #(size 'abcdefghijk'). $h.  }
"
	| const rec |
	"See if (data1 at: C) is the answer"
	(rec := (thisData at: 1) at: 1) isCollection ifFalse: [^ false].
	rec isSequenceable ifFalse: [^ false].
	[const := rec indexOf: (answers at: 1)] ifError: [^ false].
	const = 0 ifTrue: [^ false].
	(self testSel: #at: aditionalArg: const) ifFalse: [^ false]. 

	"replace data2 with const in expressions"
	resultsList add: { #at:.   self newData1, ' at: ', const printString.  {rec. const} }.
	^ true