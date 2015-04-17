as yet unclassified
comboSuggest: aKeyboardEvent

	| guessedType entries suggestionMorph methodFinderResults |
	methodFinderResults := "self methodFinderResults" #().
	methodFinderResults ifNotEmpty: [
		suggestionMorph := self displayMethodFinderResults: methodFinderResults.
		suggestionMorph informationText: 'MethodFinder'.
		^ true ].
	guessedType := self fetchTypeForReceiver: "(self receiverFrom: "self nodeAtCaret")" orWord: self wordAtCaret.
	guessedType ifNil: [ ^ true ].
	entries := (BPMarkovUtil methodsRankedByMarkovCount: guessedType type)
		collect: [ :selectorToCount |
			self createSuggestionEntry: selectorToCount key
				fromType: guessedType
				selector: selectorToCount key
				count: selectorToCount value ].

	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph informationText: (self informationTextFor: guessedType).
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | | selectedDataString |
			selectedDataString := aSuggestionEntry data selector.
			self pasteAtCaret: selectedDataString.
			(selectedDataString endsWith: ':') ifFalse: [
				self suggestHelpAST: selectedDataString ]].
	^ true