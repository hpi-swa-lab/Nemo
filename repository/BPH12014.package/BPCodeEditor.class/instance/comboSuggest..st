as yet unclassified
comboSuggest: aKeyboardEvent

	| expressionAtCaret receiverNode guessedType entries |
	receiverNode := self receiverAtCaret.
	expressionAtCaret := receiverNode isFaulty
		ifTrue: [
			self wordAtCaret ifNotEmpty: [ :word | | suggestionMorph |
				guessedType := self typeFromBinding: word.
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
							self suggestHelpAST: selectedDataString ]] ]]
		ifFalse: [
			guessedType := self guessTypeFor: receiverNode formattedCode..
			guessedType ifNil: [ ^ true ].
			entries := guessedType asOrderedCollection first methodDict keys
				collect: [ :aMethodSymbol |
					BPSuggestionEntry new
						id: aMethodSymbol;
						data: (MethodReference
							class: guessedType asOrderedCollection first
							selector: aMethodSymbol);
						displayValue: aMethodSymbol ].
			self displaySuggestionMorphWith: entries].
	^ true