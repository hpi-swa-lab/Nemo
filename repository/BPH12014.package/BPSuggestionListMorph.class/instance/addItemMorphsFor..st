as yet unclassified
addItemMorphsFor: anEntryList

	anEntryList do: [ :anEntry |
		self addItemMorph: (self createItemMorphFor: anEntry).
	].