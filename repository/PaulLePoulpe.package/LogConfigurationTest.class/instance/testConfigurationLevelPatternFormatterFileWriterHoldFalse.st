test - configuration
testConfigurationLevelPatternFormatterFileWriterHoldFalse
	| processor | 
	processor := LogConfiguration forKey: #key useLevel: #transaction showingLogAs:( '%class' asPatternFormatter) into:( 'bla.txt' asLogWriter ).
	
	self assert: (processor filter isKindOf: LevelLogFilter ) description:'Spected filter type CategoryLogFilter'.
	self assert: (processor filter category =#transaction ) description:'Spected level: #transaction '.
	self assert: (processor writer isKindOf: LogFileWriter  ) description:'Spected writer type LogFileWriter '.
	self assert: (processor formatter isKindOf: PatternLogFormatter ) description:'Spected formatter type PatternLogFormatter'.
	processor writer close.