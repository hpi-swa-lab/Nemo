private-rendering
createItemMorphFor: anEntry

	| morph |
	morph := BPSuggestionItemMorph newFor: anEntry.
	morph onMouseEnter: [self selectMorph: morph];
		onClick: [
			self selectMorph: morph.
			self confirmSelection.
		].
	^ morph