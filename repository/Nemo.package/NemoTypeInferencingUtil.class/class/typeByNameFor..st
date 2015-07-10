type inferencing
typeByNameFor: anExpressionString

	^ (self typeBySubStringNameFor: anExpressionString)
		ifNil: [ self typeBySpecialNameFor: anExpressionString ]