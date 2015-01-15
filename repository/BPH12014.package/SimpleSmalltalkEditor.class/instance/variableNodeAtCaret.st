as yet unclassified
variableNodeAtCaret
	| methodNode result |
	methodNode := RBParser parseMethod: paragraph text asString .
	result := SimpleNodeVisitor new searchEnclosingNodeFor: self startIndex on: methodNode.
	Transcript show: result; cr.
	result isVariable ifTrue: [^ result ].
	^ nil