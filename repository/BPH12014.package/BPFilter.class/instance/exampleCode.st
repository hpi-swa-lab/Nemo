as yet unclassified
exampleCode

	BPFilter pipeline: {
		BPTokenizerFilter new clazz: BPExampleClass; sourceCode: 'method: arg'.
		BPVariableNameAtCaretFilter new caretPosition: 9.
		BPVariableNameToTypeFilter new method: #method:; variableTypeBook: (BPVariableTypeBook new typeOfVariable: #myVar inClass: BPExampleClass inMethod: #method: put: String; yourself).
		BPMethodsOnClassFilter new.
		BPSqueakOverflowFilter new}