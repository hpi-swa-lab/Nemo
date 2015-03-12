as yet unclassified
pasteAtCaret: aString

	"self afterSelectionInsertAndSelect: aString."
	"self selectFrom: self stopIndex to: self startIndex."
	| replacement selectionIndex offset |
	replacement := aString.
	(self text at: self startIndex - 1) isSeparator ifFalse: [replacement := ' ' , replacement].

	offset := (replacement indexOf: $:) > 0
		ifTrue: [replacement indexOf: $:]
		ifFalse: [replacement size].
	selectionIndex := self startIndex + offset.

	self
		replace: self selectionInterval 
		with: replacement
		and: [self selectAt: selectionIndex].

	self morph editView selectionInterval: self selectionInterval.
	"self invalidateEditorMorph."
	ActiveHand newKeyboardFocus: self morph