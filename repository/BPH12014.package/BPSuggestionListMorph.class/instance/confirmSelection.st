selection
confirmSelection

	self onConfirmSelection ifNotNilDo: [ :onConfirmSelectionBlock | onConfirmSelectionBlock value: self selectedEntry ].
	self delete.