as yet unclassified
nodeAtCaret
	| node |
	[
		node := RBParser parseFaultyMethod: paragraph text asString.
		^ BPAtCaretNodeVisitor new searchEnclosingNodeFor: self startIndex on: node
	] ifError: [
		node := RBParser parseFaultyExpression: paragraph text asString.
		^ BPAtCaretNodeVisitor new searchEnclosingNodeFor: self startIndex on: node
	].
