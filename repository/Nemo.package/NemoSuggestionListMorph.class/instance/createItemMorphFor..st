private-rendering
createItemMorphFor: anEntry

	| morph |
	morph := NemoSuggestionItemMorph newFor: anEntry.
	morph on: #mouseEntered do: [self selectMorph: morph];
		on: #clicked do: [
			self selectMorph: morph.
			self confirmSelection.
		].
	^ morph