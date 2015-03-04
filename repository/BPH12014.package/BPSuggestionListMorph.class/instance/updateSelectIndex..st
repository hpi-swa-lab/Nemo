selection
updateSelectIndex: newSelectIndex

	self deselectSelectedItem.
	self selectIndex: newSelectIndex.
	self listMorph submorphs size >= self selectIndex ifTrue: [
		(self listMorph submorphs at: self selectIndex) select.
	].
	self onSelect ifNotNilDo: [ :onSelectBlock | onSelectBlock value: self selectedEntry ].