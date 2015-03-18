private-rendering
renderList

	| matchingEntries |
	self deleteAllItemMorphs.
	self entries ifNil: [^ self ].
	matchingEntries := BPStringFilter new
		entries: self entries;
		filterBy: self filterString
		limit: self maxItems.
	matchingEntries ifEmpty: [ ^ self ].
	self addItemMorphsFor: (matchingEntries 
		copyFrom: 1
		to: {matchingEntries size. self stopItemIndex} min).
	self updateSelectIndex: self selectIndex.