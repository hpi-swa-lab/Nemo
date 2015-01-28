as yet unclassified
testMethodsAtCaret

	| methods |
	methods := (BPFilter pipeline: {
			BPTokenizerFilter new clazz: BPExampleClass; sourceCode: 'method: arg'.
			BPVariableNameAtCaretFilter new caretPosition: 11.
			BPVariableNameToTypeFilter new method: #method:; variableTypeBook: (BPVariableTypeBook new typeOfVariable: #arg inClass: BPExampleClass inMethod: #method: put: String; yourself).
			BPMethodsOnClassFilter new
		}) run methods.
	self assert: String methodDict size equals: methods size