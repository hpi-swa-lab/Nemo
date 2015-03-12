accessing
storeVariable: aVariableSymbol definedBy:variable 
	^variables at: aVariableSymbol ifAbsentPut: variable.
	
	