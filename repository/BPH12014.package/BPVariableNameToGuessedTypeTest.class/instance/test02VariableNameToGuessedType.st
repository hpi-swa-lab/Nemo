as yet unclassified
test02VariableNameToGuessedType
	| typeBook varName |
	varName := 'aMorph'.
	typeBook := filter variableName: varName;
		clazz: BPExampleClass;
		method: #method:;
		run;
		variableTypeBook.
	self assert: Morph
		equals: (typeBook typeOfVariable: varName asSymbol
					inClass: BPExampleClass
					inMethod: #method:)