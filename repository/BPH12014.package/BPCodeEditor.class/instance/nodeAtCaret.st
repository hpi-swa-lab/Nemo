editor accessing
nodeAtCaret
	| node |
	[ node := RBParser parseFaultyMethod: paragraph text asString.
		^ NemoNodeAtCaretVisitor searchEnclosingNodeFor: self startIndex on: node ]
		ifError: [
			[ node := RBParser parseFaultyExpression: paragraph text asString.
				^ NemoNodeAtCaretVisitor searchEnclosingNodeFor: self startIndex on: node ]
				ifError: [] ].
	^ nil
