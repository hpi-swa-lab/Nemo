as yet unclassified
suggestHelp4: aKeyboardEvent
	| methods filter chain |

	filter := (BPFilter pipeline: {
		BPTokenizerFilter new clazz: self model selectedClass; sourceCode: paragraph text asString.
		BPVariableNameAtCaretFilter new caretPosition: self startIndex}) run.
	chain := IdentityDictionary new.
	((BPSearchIndexBook codeOfType: filter variableToken type with: filter variableName)
		collect: [ :tokenRef | tokenRef method ]) asSet do: [ :methodRef |	
			BPMarkovFilter
				enrichChain: chain
				forMethodReference: methodRef
				withTokens: (BPParserUtil parseTokensIn: methodRef sourceString for: methodRef actualClass)
				usingOrder: 0].
 
	methods := (((chain at: filter variableToken type ifAbsent: [Dictionary new])
					at: filter variableName ifAbsent: [Bag new]) sortedCounts)
		collect: [ :assoc | | aBPMarkovChainTail |
			aBPMarkovChainTail := assoc value.
			aBPMarkovChainTail count: assoc key.
			aBPMarkovChainTail].

	BPSuggestionListMorph new
		updateMaxItems: 20;
		updateEntries: (methods collectWithIndex: [ :aBPMarkovChain :index |
			BPSuggestionEntry new
				id: index;
				data: aBPMarkovChain;
				displayValue: aBPMarkovChain asText ]);
		onSelect: [ :aSuggestionEntry |
			self pasteAtCaret: aSuggestionEntry value asString ];
		position: self absolutePositionForPopUp;
		width: 300;
		openInWorld;
		focusTextFIeld.
	^ true