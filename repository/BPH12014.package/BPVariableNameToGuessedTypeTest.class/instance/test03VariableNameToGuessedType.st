as yet unclassified
test03VariableNameToGuessedType
	| typeBook varName |
	varName := 'aBPExampleClass'.
	typeBook := filter variableName: varName;
		clazz: BPExampleClass;
		method: #method:;
		run;
		variableTypeBook.
	self assert: BPExampleClass
		equals: (typeBook typeOfVariable: varName asSymbol
					inClass: BPExampleClass
					inMethod: #method:)