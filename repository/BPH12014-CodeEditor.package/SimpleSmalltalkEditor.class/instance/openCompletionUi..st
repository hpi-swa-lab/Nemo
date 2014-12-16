as yet unclassified
openCompletionUi: aKeyboardEvent
	
	| currentWord methodNode fakeResult |
	currentWord := self wordAtCaret.
	methodNode := RBParser parseMethod: paragraph text asString.
	fakeResult := SimpleNodeVisitor new searchEnclosingNodeFor: self startIndex on: methodNode.
	fakeResult isVariable ifTrue: [self resultSelected: fakeResult asString].

	^ true