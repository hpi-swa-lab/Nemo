as yet unclassified
exampleCode

	| BPTokenizerFilter BPTokenAtCaretFilter BPTokenToTypeFilter BPMethodsOnClassFilter |
	BPFilter pipeline: {
		BPTokenizerFilter new sourceCode: 'abc 123'.
		BPTokenAtCaretFilter new caretPosition: 5.
		BPTokenToTypeFilter new variableTypes: 'SomeClass>>anyMethod'.
		BPMethodsOnClassFilter new
	}.
