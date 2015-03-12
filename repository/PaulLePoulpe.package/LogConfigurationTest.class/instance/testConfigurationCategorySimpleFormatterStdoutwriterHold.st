test - configuration
testConfigurationCategorySimpleFormatterStdoutwriterHold
	| processor | 
	processor := LogConfiguration forKey: #key useCategory: #transaction showingLogAs: #simple into: #stdout.
	
	self assert: (processor filter isKindOf: CategoryLogFilter ) description:'Spected filter type CategoryLogFilter'.
	self assert: (processor filter category =#transaction ) description:'Spected category: #transaction '.
	self assert: (processor writer isKindOf: LogStdoutWriter  ) description:'Spected writer type LogStdoutWriter '.
	self assert: (processor formatter isKindOf: SimpleLogFormatter ) description:'Spected formatter type SimpleLogFormatter '.
	