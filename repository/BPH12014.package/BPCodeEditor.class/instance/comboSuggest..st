as yet unclassified
comboSuggest: aKeyboardEvent

	| guessedType entries suggestionMorph methodFinderResults |
	methodFinderResults := self methodFinderResults.
	methodFinderResults ifNotNil: [
		suggestionMorph := self displayMethodFinderResults: methodFinderResults.
		^ true ].
	guessedType := self fetchTypeForReceiver: "(self receiverFrom: "self nodeAtCaret")" orWord: self wordBeforeCaret.
	guessedType ifNil: [
		suggestionMorph := self displayAvailableVariables: (NemoParserUtil parseMethodArgsAndTempVarNamesIn: paragraph string for: self model selectedClass).
		suggestionMorph informationText: 'Available variables'.
		^ true ].
	entries := (NemoMarkovUtil methodsRankedByMarkovCount: guessedType type withRanker: NemoMethodRanker new usingChain: BPBookshelf markovASTChainBook markovChain)
		collect: [ :selectorToCount |
			self createSuggestionEntry: selectorToCount key
				fromType: guessedType
				selector: selectorToCount key
				count: ((selectorToCount value * 100) rounded / 100) asFloat ].

	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph informationText: (self informationTextFor: guessedType).
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | 	self confirmSelection: aSuggestionEntry data selector on: suggestionMorph ];
		on: #textChanged do: [ :text | self textChanged: text on: suggestionMorph ];
		on: #suggestionCanceled do: [ self suggestionCanceledOn: suggestionMorph ].
	self suggestionMorph: suggestionMorph.
	^ true