selection
confirmSelection

	self emit: #confirmSelection with: self selectedEntry.
	self delete.