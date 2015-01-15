as yet unclassified
openCompletionUi: aKeyboardEvent
	
	| node |
	node := self variableNodeAtCaret.
 	node ifNotNil: [self resultSelected: node asString].

	^ true