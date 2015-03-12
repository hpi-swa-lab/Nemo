accessing
fetchVariable: aVariableSymbol
	^variables at: aVariableSymbol ifAbsent:[
		self fetchSharedVariable: aVariableSymbol.	
	].
	
