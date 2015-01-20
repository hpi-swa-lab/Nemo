as yet unclassified
nodeAtCaret
	| methodNode |
	methodNode := RBParser parseMethod: paragraph text asString .
	^ SimpleNodeVisitor new searchEnclosingNodeFor: self startIndex on: methodNode
