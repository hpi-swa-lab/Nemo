editor accessing
nodeAtCaret

	^ (NemoParserUtil parseASTFromString: self string)
		ifNotNil: [ :node | 
			NemoNodeAtCaretVisitor
				searchEnclosingNodeFor: self startIndex
				on: node ]