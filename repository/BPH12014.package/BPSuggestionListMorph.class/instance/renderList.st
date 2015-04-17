private-rendering
renderList

	| matchingEntries |
	self deleteAllItemMorphs.
	self entries ifNil: [^ self ].
	matchingEntries := BPStringFilter
		filter: self entries
		by: self filterString
		limit: self maxItems.
	matchingEntries ifEmpty: [
		self listMorph height: 0.
		^ self ].
	self addItemMorphsFor: matchingEntries.
	self updateSelectIndex: self selectIndex.