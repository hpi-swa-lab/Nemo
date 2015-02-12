as yet unclassified
pasteAtCaret: aString

	"self afterSelectionInsertAndSelect: aString."
	"self selectFrom: self stopIndex to: self startIndex."
	self
		replace: self selectionInterval 
		with: aString
		and: [self selectAt: self startIndex + aString size.].
	
	self morph editView selectionInterval: self selectionInterval.
	self invalidateEditorMorph.