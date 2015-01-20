find a constant
instanceVariable
	"Only return (data1 instVarNamed: 'corner').  Works for inst vars whose getters are not on the approved list for the MethodFinder.
	Without this method, the MF will return (data1 instanceVariableValues third), but that does not help the user.  
	We want to return an actual accessor (getter method), but it is too hard to tell if that method has any side effects.  Some getters do.  We hope the user will see instVarNamed: and know to go to the class and see if there is a getter.  Maybe define one if it's not there.
	MethodFinder methodFor: { {34. SlotInformation new}.  0.1  }
"
	| rec ivarNames ans ourIndex |
	"which inst var might work?"
	rec := (thisData at: 1) at: 1.
	ivarNames := rec class allInstVarNames.
	ans := answers at: 1.
	1 to: ivarNames size do: [:ii |
		((rec instVarAt: ii) closeToSafe: ans) ifTrue: [ourIndex := ii].
		].
	ourIndex ifNil: [^ false].

	thisData with: answers do: [:argArray :anAns |
		rec := argArray first.
		((rec instVarAt: ourIndex) closeToSafe: anAns) ifFalse: [^ false].
		].

	resultsList add: { #instVarNamed:.   self newData1, ' instVarNamed: #', (ivarNames at: ourIndex).  (thisData at: 1) }.
	^ true