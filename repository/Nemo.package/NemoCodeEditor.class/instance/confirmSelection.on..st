code suggestion
confirmSelection: selectedDataString on: aSuggestionMorph
	self
		paste: selectedDataString
		at: ((aSuggestionMorph valueOfProperty: #lastInterval) ifNil: [self selectionInterval]).
	self comboSuggest: nil.
	"(selectedDataString endsWith: ':')
		ifTrue: [ self comboSuggest: nil ]
		ifFalse: [ self suggestHelpAST: selectedDataString ]"