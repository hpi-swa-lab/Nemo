editor accessing
nodeAtCaret

	^ (NemoParserUtil parseASTFor: self string)
		ifNotNil: [ :node | 
			NemoNodeAtCaretVisitor
				searchEnclosingNodeFor: self startIndex
				on: node ]