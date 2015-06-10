editor accessing
nodeAtCaret

	^ (NemoParserUtil parseASTFromString: self string)
		ifNotNil: [ :node | | position |
			position := self wordPositionBeforeCaret last.
			node bestNodeFor: (position to: position)
			"NemoNodeAtCaretVisitor
				searchEnclosingNodeFor: self wordPositionBeforeCaret last
				on: node" ]