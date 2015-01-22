as yet unclassified
testMethodsAtCaret

	| methods |
	methods := (BPFilter pipeline: {
			BPTokenizerFilter new clazz: BPExampleClass; sourceCode: 'method: arg'.
			BPVariableNameAtCaretFilter new caretPosition: 9.
			BPVariableNameToTypeFilter new method: #method:; variableTypeBook: (BPVariableTypeBook new typeOfVariable: #myVar inClass: BPExampleClass inMethod: #method: put: String; yourself).
			BPMethodsOnClassFilter new
		}) run methods.
	self assert: 1 equals: methods size.
	self assert: #method: equals: methods first