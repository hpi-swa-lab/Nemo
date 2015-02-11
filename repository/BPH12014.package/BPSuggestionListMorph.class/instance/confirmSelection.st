selection
confirmSelection

	self onSelect ifNotNilDo: [ :onSelectBlock | onSelectBlock value: self selectedEntry ].
	self delete.