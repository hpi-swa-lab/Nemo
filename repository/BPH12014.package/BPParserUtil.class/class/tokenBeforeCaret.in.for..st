parsing
tokenBeforeCaret: aCaretPosition in: aSourceCodeString for: aClass 
	| list |
	list := BPParserUtil parseTokensIn: aSourceCodeString for: aClass.
	^ list
		reduce: [:last :current | current end < aCaretPosition
									ifTrue: current
									ifFalse: last]