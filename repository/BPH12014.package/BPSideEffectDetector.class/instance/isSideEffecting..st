api
isSideEffecting: aMethodReference
	| ast |
	(self quickCheck: aMethodReference) ifNotNil: [ :aBoolean | ^ aBoolean ].
	"self halt."
	ast := BPParserUtil parseASTFor: aMethodReference.
	sideEffecting := false.
	self visitNode: ast.
	^ sideEffecting