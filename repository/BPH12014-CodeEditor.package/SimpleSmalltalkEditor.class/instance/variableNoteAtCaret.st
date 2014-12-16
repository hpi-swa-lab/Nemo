as yet unclassified
variableNoteAtCaret
	| methodNode result |
	methodNode := RBParser parseMethod: paragraph text asString .
	result := SimpleNodeVisitor new searchEnclosingNodeFor: self startIndex on: methodNode.
	result isVariable ifTrue: [^ result asString].
	^ nil