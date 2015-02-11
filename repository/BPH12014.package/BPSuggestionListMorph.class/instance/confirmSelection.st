selection
confirmSelection

	self onSelect ifNotNilDo: [ :onSelectBlock | onSelectBlock value: (self entries at: self selectIndex). ].
	self delete.