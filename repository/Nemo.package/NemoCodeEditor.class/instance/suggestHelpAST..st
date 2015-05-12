code suggestion
suggestHelpAST: aKeyboardEventOrString
	| command filter suggestionMorph chains chainKey entries guessedType infoText |
	command := self selection asString withBlanksTrimmed.
	aKeyboardEventOrString isString
		ifTrue: [chainKey := aKeyboardEventOrString]
		ifFalse: [
			filter := (BPFilter pipeline: {
				BPTokenizerFilter new clazz: self model selectedClass; sourceCode: paragraph text asString.
				BPVariableNameAtCaretFilter new caretPosition: self startIndex.}) run.
			chainKey := filter variableName].

	chains := ((BPBookshelf markovASTChainBook markovChain) sortedCountsOf: chainKey)
		collect: [ :assoc | | aBPMarkovFromASTChain |
			aBPMarkovFromASTChain := assoc.
			"aBPMarkovFromASTChain count: assoc key".
			aBPMarkovFromASTChain].

	infoText := 'Untyped chain guess'.
	guessedType := NemoTypeInferencingUtil
		typeFor: self nodeAtCaret
		orWord: chainKey
		selfClass: self model selectedClassOrMetaClass
		currentSourceCode: self string model: self model.
	guessedType ifNotNil: [ chains := chains select: [ :aBPMarkovFromASTChain |
			guessedType type canUnderstand: aBPMarkovFromASTChain value ].
		infoText := 'Typed chain guess for: ' , guessedType type name ].

	entries := chains collectWithIndex: [ :aBPMarkovFromASTChain :index |
			[BPSuggestionEntry new
				id: index;
				data: aBPMarkovFromASTChain value;
				displayValue: aBPMarkovFromASTChain value ,  ' (' , aBPMarkovFromASTChain key , ')' ]].
	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph informationText: infoText.
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | self confirmSelection: aSuggestionEntry data asString on: suggestionMorph ];
		on: #textChanged do: [ :text | self textChanged: text on: suggestionMorph ];
		on: #focusChanged do: [ :hasFocus | hasFocus ifFalse: [ suggestionMorph delete. ] ];
		on: #suggestionCanceled do: [ self suggestionCanceledOn: suggestionMorph ].
	^ true