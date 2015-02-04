private-processing
process

	self variableTypeBook: (BPVariableTypeBook new
					typeOfVariable: self variableName asSymbol
					inClass: self clazz
					inMethod: self method
					put: (self guessTypeForName: self variableName);
				yourself)