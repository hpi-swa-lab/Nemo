as yet unclassified
comboSuggest: aKeyboardEvent

	| guessedType entries suggestionMorph |
	guessedType := self fetchTypeForReceiver: (self receiverFrom: self nodeAtCaret) orWord: self wordAtCaret.
	guessedType ifNil: [ ^ true ].
	entries := (BPMarkovUtil methodsRankedByMarkovCount: guessedType)
		collect: [ :selectorToCount |
			BPSuggestionEntry new
				id: selectorToCount key;
				data: (MethodReference
					class: guessedType
					selector: selectorToCount key);
				displayValue: selectorToCount key , ' (' , selectorToCount value , ')' ].

	suggestionMorph := self displaySuggestionMorphWith: entries.
		suggestionMorph
			on: #confirmSelection do: [ :aSuggestionEntry | | selectedDataString |
				selectedDataString := aSuggestionEntry data selector.
				self pasteAtCaret: selectedDataString.
				(selectedDataString endsWith: ':') ifFalse: [
					self suggestHelpAST: selectedDataString ]].
	^ true