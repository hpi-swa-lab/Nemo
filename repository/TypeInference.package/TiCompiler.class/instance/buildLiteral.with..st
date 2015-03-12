nodes
buildLiteral: aValue with: aContextBuilder 
	
	self assertContext: aContextBuilder.
	
	^literals at: aValue
		ifAbsentPut: [TiLiteralNode new setValue: aValue].
		
	