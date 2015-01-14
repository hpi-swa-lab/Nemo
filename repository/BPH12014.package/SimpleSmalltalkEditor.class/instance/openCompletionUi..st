as yet unclassified
openCompletionUi: aKeyboardEvent
	
	| node |
	node := self variableNoteAtCaret.
 	node ifNotNil: [self resultSelected: node asString].

	^ true