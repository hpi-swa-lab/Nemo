private-accessing
addItemMorphsFor: anEntryList

	anEntryList do: [ :anEntry |
		self addItemMorph: (self createItemMorphFor: anEntry).
	].