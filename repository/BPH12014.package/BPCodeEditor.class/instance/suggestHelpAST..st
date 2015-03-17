as yet unclassified
suggestHelpAST: aKeyboardEventOrString
	| command filter suggestionMorph chains chainKey entries |
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

	entries := chains collectWithIndex: [ :aBPMarkovFromASTChain :index |
			[BPSuggestionEntry new
				id: index;
				data: aBPMarkovFromASTChain;
				displayValue: aBPMarkovFromASTChain asText ]].
	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | | selectedDataString |
			selectedDataString := aSuggestionEntry data asString.
			self pasteAtCaret: selectedDataString.
			suggestionMorph delete.
			(selectedDataString endsWith: ':') ifFalse: [
				self suggestHelpAST: selectedDataString] ].
	^ true