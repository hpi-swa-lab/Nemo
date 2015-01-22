as yet unclassified
renderList

	| matchingEntries |
	self deleteAllItemMorphs.
	matchingEntries := BPStringFilter new
		entries: self entries;
		filterBy: self filterString.
	self addItemMorphsFor: (matchingEntries 
		copyFrom: 1
		to: {matchingEntries size. self stopItemIndex} min)