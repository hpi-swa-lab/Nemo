as yet unclassified
testTokenToType

	self assert: String
		equals: (filter variableName: #myVar;
			clazz: BPExampleClass;
			method: #method:;
			variableTypeBook: (BPVariableTypeBook new typeOfVariable: #myVar inClass: BPExampleClass inMethod: #method: put: String; yourself);
			run; variableName)