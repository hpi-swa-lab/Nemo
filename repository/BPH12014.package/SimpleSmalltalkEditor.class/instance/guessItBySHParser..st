as yet unclassified
guessItBySHParser: aKeyboardEvent 
	| list caretPosition abc temps methodArgs |
	list := SHParserST80 new
		rangesIn: paragraph text asString
		classOrMetaClass: self model clazz
		workspace: nil
		environment: nil.
	temps := (list select: [ :range | range type = #patternTempVar])
				collect: [ :range | paragraph text asString copyFrom: range start to: range end].
	methodArgs := (list select: [ :range | range type = #patternArg])
						collect: [ :range | paragraph text asString copyFrom: range start to: range end].
	
	caretPosition := self startIndex.
	abc := list reduce: [ :last :current | 
		(current end < caretPosition) 
			ifTrue: current
			ifFalse: last].
	Transcript show: abc type; show: ' ' , abc start asString; cr.
	^ true