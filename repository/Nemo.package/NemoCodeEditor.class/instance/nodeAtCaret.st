editor accessing
nodeAtCaret

	^ (NemoParserUtil parseASTFromString: self string)
		ifNotNil: [ :node | | position |
			position := NemoStringUtil firstNonWhitespaceIndexIn: self string before: self startIndex - 1.
			node bestNodeFor: (position to: position)
			"NemoNodeAtCaretVisitor
				searchEnclosingNodeFor: self wordPositionBeforeCaret last
				on: node" ]