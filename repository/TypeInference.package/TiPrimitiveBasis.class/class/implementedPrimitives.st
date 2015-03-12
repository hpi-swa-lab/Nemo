inquires
implementedPrimitives
	^ self selectors  select: [:each | each beginsWith: 'primitive'] 