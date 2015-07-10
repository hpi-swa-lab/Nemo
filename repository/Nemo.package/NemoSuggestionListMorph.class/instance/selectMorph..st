private-rendering
selectMorph: anItemMorph

	self updateSelectIndex: (self listMorph submorphs indexOf: anItemMorph ifAbsent: [^ self]).