variables
localVariable: aSymbol with: aContextBuilder 
	self assertContext: aContextBuilder.
	
	^ aContextBuilder storeVariable: aSymbol definedBy: [
			TiLocalVariable new 
					setName: aSymbol;
					yourself.
		].