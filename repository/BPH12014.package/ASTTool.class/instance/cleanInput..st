actions
cleanInput: aClassName
	^ Smalltalk at: aClassName asString withBlanksTrimmed asSymbol ifAbsent: []