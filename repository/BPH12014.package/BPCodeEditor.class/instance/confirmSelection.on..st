as yet unclassified
confirmSelection: selectedDataString on: aSuggestionMorph

	self paste: selectedDataString at: ((aSuggestionMorph valueOfProperty: #lastInterval) ifNil: [self selectionInterval]).
	(selectedDataString endsWith: ':')
		ifTrue: [ self comboSuggest: nil ]
		ifFalse: [ self suggestHelpAST: selectedDataString ]