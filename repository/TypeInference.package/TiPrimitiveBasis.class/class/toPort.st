inquires
toPort
	| table | 
	table := self primitiveTable.
	
	^self implementedPrimitives select: [:p | (table contains:[ :i | i last = p ]) not ].
