as yet unclassified
resultSelected: aString
	"self insertAndSelect: aString at: self startIndex "
	self afterSelectionInsertAndSelect: aString.
	self onCloseFancyUI.