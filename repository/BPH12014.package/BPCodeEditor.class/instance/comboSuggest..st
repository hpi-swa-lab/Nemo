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
	entries := (BPMarkovUtil methodsRankedByMarkovCount: guessedType type withRanker: NemoMethodRanker new)
		collect: [ :selectorToCount |
			self createSuggestionEntry: selectorToCount key
				fromType: guessedType
				selector: selectorToCount key
				count: ((selectorToCount value * 100) rounded / 100) asFloat].

	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph informationText: (self informationTextFor: guessedType).
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | | selectedDataString |
			selectedDataString := aSuggestionEntry data selector.
			self paste: selectedDataString at: ((suggestionMorph valueOfProperty: #lastInterval) ifNil: [self selectionInterval]).
			(selectedDataString endsWith: ':') ifFalse: [
				self suggestHelpAST: selectedDataString ]];
		on: #textChanged do: [ :text | | lastInterval replacement |
			lastInterval := suggestionMorph valueOfProperty: #lastInterval.
			lastInterval ifNil: [ lastInterval := self selectionInterval ].			
			replacement := text.
			(self text at: self startIndex - 1) isSeparator ifFalse: [replacement := ' ' , replacement].
			self
				replace: lastInterval
				with: replacement
				and: [].
			"self afterSelectionInsertAndSelect: text."
			suggestionMorph setProperty: #lastInterval toValue: self selectionInterval.
			ActiveHand newKeyboardFocus: suggestionMorph chainSuggestionListMorph filterMorph textMorph ];
		on: #focusChanged do: [ :hasFocus | hasFocus ifFalse: [ suggestionMorph delete. ] ];
		on: #suggestionCanceled do: [ suggestionMorph valueOfProperty: #lastInterval ifPresentDo: [ :lastSelectionInterval |
			self
				replace: lastSelectionInterval
				with: ''
				and: []].
			ActiveHand newKeyboardFocus: self morph].
	^ true