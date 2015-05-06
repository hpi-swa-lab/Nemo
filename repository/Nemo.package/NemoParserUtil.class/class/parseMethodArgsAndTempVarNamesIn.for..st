parsing
parseMethodArgsAndTempVarNamesIn: aSourceCodeString for: aClass 
	| list dict |
	list := NemoParserUtil parseTokensIn: aSourceCodeString for: aClass.
	dict := Dictionary new.
	list do: [:range | 
			(self
				match: #patternTempVar
				range: range
				in: aSourceCodeString)
					ifNotNil: [:match | (dict at: #patternTempVar ifAbsentPut: OrderedCollection new) add: match].
			(self
				match: #patternArg
				range: range
				in: aSourceCodeString)
					ifNotNil: [:match | (dict at: #patternArg ifAbsentPut: OrderedCollection new) add: match]].
	^ dict