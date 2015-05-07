code suggestion
suggestHelp: aKeyboardEvent
	| command methods filter suggestionMorph entries |
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
	"suggestionMorph := BPSuggestionListMorph new
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
		focusTextFIeld."
	entries := methods collectWithIndex: [ :aBPMarkovChain :index |
			[BPSuggestionEntry new
				id: index;
				data: aBPMarkovChain;
				displayValue: aBPMarkovChain asText] ].
	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph bounds: (suggestionMorph bounds translatedToBeWithin: ActiveWorld bounds).
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | self confirmSelection: aSuggestionEntry data asString on: suggestionMorph ];
		on: #textChanged do: [ :text | self textChanged: text on: suggestionMorph ];
		on: #focusChanged do: [ :hasFocus | hasFocus ifFalse: [ suggestionMorph delete. ] ];
		on: #suggestionCanceled do: [ self suggestionCanceledOn: suggestionMorph ].
	^ true