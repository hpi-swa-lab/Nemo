selection
confirmSelection

	self selectedEntry ifNotNil: [ :selection |
		self emit: #confirmSelection with: selection.
		self delete ]