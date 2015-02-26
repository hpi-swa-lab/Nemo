as yet unclassified
guessItBySHParser: aKeyboardEvent
	| abc |
	abc := BPParserUtil tokenBeforeCaret: self startIndex in: paragraph text asString for: self model clazz.
	^ true