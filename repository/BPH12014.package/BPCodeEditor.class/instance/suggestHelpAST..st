as yet unclassified
suggestHelpAST: aKeyboardEventOrString
	| command filter suggestionMorph chains chainKey |
	command := self selection asString withBlanksTrimmed.
	aKeyboardEventOrString isString
		ifTrue: [chainKey := aKeyboardEventOrString]
		ifFalse: [
			filter := (BPFilter pipeline: {
				BPTokenizerFilter new clazz: self model selectedClass; sourceCode: paragraph text asString.
				BPVariableNameAtCaretFilter new caretPosition: self startIndex.}) run.
			chainKey := filter variableName].

	chains := (((BPBookshelf markovASTChainBook markovChain)
					at: chainKey ifAbsent: [Bag new]) sortedCounts)
		collect: [ :assoc | | aBPMarkovFromASTChain |
			aBPMarkovFromASTChain := assoc value.
			aBPMarkovFromASTChain count: assoc key.
			aBPMarkovFromASTChain].

	suggestionMorph := BPSuggestionListMorph new
		updateMaxItems: 20;
		updateEntries: (chains collectWithIndex: [ :aBPMarkovFromASTChain :index |
			[BPSuggestionEntry new
				id: index;
				data: aBPMarkovFromASTChain;
				displayValue: aBPMarkovFromASTChain asText].
		]);
		position: self absolutePositionForPopUp;
		width: 300;
		openInWorld;
		focusTextFIeld.
	suggestionMorph bounds: (suggestionMorph bounds translatedToBeWithin: ActiveWorld bounds).
	suggestionMorph
		onEscape: [ suggestionMorph delete ];
		onConfirmSelection: [ :aSuggestionEntry | | selectedDataString |
			selectedDataString := aSuggestionEntry data asString.
			self pasteAtCaret: selectedDataString.
			suggestionMorph delete.
			(selectedDataString endsWith: ':') ifFalse: [
				self suggestHelpAST: selectedDataString] ].
	^ true