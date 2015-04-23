as yet unclassified
comboSuggest: aKeyboardEvent

	| guessedType entries suggestionMorph methodFinderResults |
	methodFinderResults := self methodFinderResults.
	methodFinderResults ifNotEmpty: [
		suggestionMorph := self displayMethodFinderResults: methodFinderResults.
		^ true ].
	guessedType := self fetchTypeForReceiver: "(self receiverFrom: "self nodeAtCaret")" orWord: self wordBeforeCaret.
	guessedType ifNil: [
		suggestionMorph := self displayAvailableVariables: (BPParserUtil parseMethodArgsAndTempVarNamesIn: paragraph string for: self model selectedClass).
		suggestionMorph informationText: 'Available variables'.
		^ true ].
	entries := (BPMarkovUtil methodsRankedByMarkovCount: guessedType type withRanker: NemoMethodRanker new)
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
		on: #focusChanged do: [ :hasFocus | hasFocus ifFalse: [ suggestionMorph delete. ] ];
		on: #suggestionCanceled do: [ self suggestionCanceledOn: suggestionMorph ].
	^ true