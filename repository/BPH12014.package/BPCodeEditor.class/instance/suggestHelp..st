as yet unclassified
suggestHelp: aKeyboardEvent
	| command methods filter suggestionMorph |
	command := self selection asString withBlanksTrimmed.
	filter := (BPFilter pipeline: {
		BPTokenizerFilter new clazz: self model selectedClass; sourceCode: paragraph text asString.
		BPVariableNameAtCaretFilter new caretPosition: self startIndex.
		BPMarkovFilter new methodReference: (MethodReference class: self model selectedClassOrMetaClass selector: self model selectedMessageName).}) run.

	methods := (((filter markovChain at: filter variableToken type ifAbsent: [Dictionary new])
					at: filter variableName ifAbsent: [Bag new]) sortedCounts)
		collect: [ :assoc | | aBPMarkovChainTail |
			aBPMarkovChainTail := assoc value.
			aBPMarkovChainTail count: assoc key.
			aBPMarkovChainTail].

	methods := self filterIncludedMarkovChains: methods.

	"sort: [ :a :b | a size < b size ]".
	suggestionMorph := BPSuggestionListMorph new
		updateMaxItems: 20;
		updateEntries: (methods collectWithIndex: [ :aBPMarkovChain :index |
			[BPSuggestionEntry new
				id: index;
				data: aBPMarkovChain;
				displayValue: aBPMarkovChain asText].
		]);
		position: self absolutePositionForPopUp;
		width: 300;
		openInWorld;
		focusTextFIeld.
	suggestionMorph bounds: (suggestionMorph bounds translatedToBeWithin: ActiveWorld bounds).
	suggestionMorph
		onEscape: [ suggestionMorph delete ];
		onConfirmSelection: [ :aSuggestionEntry |
			self pasteAtCaret: aSuggestionEntry data asString.
			suggestionMorph delete ];
		onNavigateRight: [| markov mr sourceString stringToSelect |
			markov := suggestionMorph selectedEntry data.
			(markov isKindOf: BPMarkovChain) ifTrue: [
				mr := (MethodReference class: markov method actualClass selector: markov method selector).
				sourceString := markov method sourceString.
				stringToSelect := sourceString
					copyFrom: markov tailTokens first start
					to: markov tailTokens last end.
				SystemNavigation default 
					browseMessageList: (Array with: mr)
					name: mr asStringOrText
					autoSelect: stringToSelect].].
	^ true