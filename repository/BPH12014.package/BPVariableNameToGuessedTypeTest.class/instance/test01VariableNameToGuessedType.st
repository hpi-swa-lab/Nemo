as yet unclassified
test01VariableNameToGuessedType
	| typeBook |
	typeBook := filter variableName: 'morph';
		clazz: BPExampleClass;
		method: #method:;
		run;
		variableTypeBook.
	self assert: Morph
		equals: (typeBook typeOfVariable: 'morph' asSymbol
					inClass: BPExampleClass
					inMethod: #method:)