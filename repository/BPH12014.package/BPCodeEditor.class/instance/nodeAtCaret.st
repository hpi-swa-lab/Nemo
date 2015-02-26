as yet unclassified
nodeAtCaret
	| methodNode |
	methodNode := RBParser parseFaultyMethod: paragraph text asString.
	^ BPAtCaretNodeVisitor new searchEnclosingNodeFor: self startIndex on: methodNode
