find a constant
constLastPart
	"Test for (data1 first: C)  (data1 allButLast: N)
	MethodFinder methodFor: { {{1. 2. 3. 4. 5}}.   #(3 4 5).  #('abcdefghijk'). 'ijk'.  }
	MethodFinder methodFor: { {{1. 2. 3. 4. 5}}.   #(4 5).  #('abcdef'). 'def'.  }
"
	| const rec |
	(rec := (thisData at: 1) at: 1) isSequenceable ifFalse: [^ false].
	(answers at: 1) isSequenceable ifFalse: [^ false].
	(rec endsWith: (answers at: 1)) ifFalse: [^ false].
.	const := (answers at: 1) size.

	(self testSel: #last: aditionalArg: const) ifTrue: [
		resultsList add: { #last:.   self newData1, ' last: ', const printString.  (thisData at: 1), {const} }.
		^ true].
	const := rec size - const.
	(self testSel: #allButFirst: aditionalArg: const) ifTrue: [
		resultsList add: { #allButFirst:.   self newData1, ' allButFirst: ', const printString.  (thisData at: 1), {const} }.
		^ true].

	^ false