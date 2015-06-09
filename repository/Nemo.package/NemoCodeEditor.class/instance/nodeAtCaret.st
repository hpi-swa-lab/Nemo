editor accessing
nodeAtCaret

	^ (NemoParserUtil parseASTFromString: self string)
		ifNotNil: [ :node | 
			NemoNodeAtCaretVisitor
				searchEnclosingNodeFor: self wordPositionBeforeCaret last
				on: node ]