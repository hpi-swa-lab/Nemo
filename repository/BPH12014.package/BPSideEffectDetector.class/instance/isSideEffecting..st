api
isSideEffecting: aMethodReference
	| ast |
	ast := BPParserUtil parseASTFor: aMethodReference.
	sideEffecting := false.
	self visitNode: ast.
	^ sideEffecting