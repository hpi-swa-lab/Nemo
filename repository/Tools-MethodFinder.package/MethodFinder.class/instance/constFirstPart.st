find a constant
constFirstPart
	"Test for (data1 first: C)  (data1 allButLast: N)
	MethodFinder methodFor: { {{1. 2. 3. 4. 5}}.   #(1 2 3).  #('abcdefghijk'). 'abc'.  }
	MethodFinder methodFor: { {{1. 2. 3. 4. 5}}.   #(1 2 3).  #('abcdef'). 'abcd'.  }
"
	| const rec |
	(rec := (thisData at: 1) at: 1) isSequenceable ifFalse: [^ false].
	(answers at: 1) isSequenceable ifFalse: [^ false].
	(rec beginsWith: (answers at: 1)) ifFalse: [^ false].
.	const := (answers at: 1) size.

	(self testSel: #first: aditionalArg: const) ifTrue: [
		resultsList add: { #first:.   self newData1, ' first: ', const printString.  (thisData at: 1), {const} }.
		^ true].
	const := rec size - const.
	(self testSel: #allButLast: aditionalArg: const) ifTrue: [
		resultsList add: { #allButLast:.   self newData1, ' allButLast: ', const printString.  (thisData at: 1), {const} }.
		^ true].

	^ false