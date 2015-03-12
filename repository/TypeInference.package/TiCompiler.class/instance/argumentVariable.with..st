variables
argumentVariable: aSymbol with: aContextBuilder
	self assertContext: aContextBuilder.
	
	^ aContextBuilder storeVariable: aSymbol definedBy:  [
			TiArgumentVariable new setName: aSymbol; yourself.
		].