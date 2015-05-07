api
isSideEffecting: aMethodReference
	| ast |
	(self quickCheck: aMethodReference) ifNotNil: [ :aBoolean | ^ aBoolean ].
	ast := NemoParserUtil parseASTFromMethodReference: aMethodReference.
	sideEffecting := false.
	self visitNode: ast.
	^ sideEffecting