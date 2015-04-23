as yet unclassified
suggestionCanceledOn: aSuggestionMorph
	aSuggestionMorph valueOfProperty: #lastInterval ifPresentDo: [ :lastSelectionInterval |
		self replace: lastSelectionInterval with: '' and: [] ].
	ActiveHand newKeyboardFocus: self morph