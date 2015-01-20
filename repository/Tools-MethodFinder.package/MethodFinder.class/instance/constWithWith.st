find a constant
constWithWith
	"Supply the class needed to create a collection.  Array with: 1 with: 2, when only have 1 and 2 as args.  Need Array. 
	MethodFinder methodFor: #( (1 3 4)  (1 3 4)  ) 
"
	| mf2 resultsList2 newData |
	"Do allow this to run with just ONE example."
	"no answer so far"
	resultsList size > 0 ifTrue: [^ false].
	"answer is a collection"
	(answers at: 1) isCollection ifFalse: [^ false].
	"answer size = number of args"
	(answers at: 1) size = (thisData at: 1) size ifFalse: [^ false].
	"No classes in args -- stop recursion"
	((thisData at: 1) allSatisfy: [:nn | nn isBehavior not]) ifFalse: [^ false].

	"add a new first arg that is the class, and try again"
	mf2 := MethodFinder new.
	newData := thisData collect: [:args | args, {(answers at: 1) class}].

	resultsList2 := (mf2 loadData: newData answers: answers) searchForOne.
	resultsList2 isEmpty ifTrue: [^ false].
	" string    (data1 with: data1 with: data2 with: data3) "
	(resultsList2 at: 1) at: 2 put: (" '(', "  (answers at: 1) class name, ' ', (resultsList2 first second allButFirst: 6)).
	"completely new results"
	resultsList := resultsList2.
	^ true
