tests
testCustomFormatter
	| formatter givenLog result | 
	
	result := [ :log | givenLog := log ] asCustomLogFormatter format: info.

	self assert: givenLog = info description:'CustomLogFormatter must receive info logEntity as parameter! ' .
	self assert: (result isKindOf: String  )description: 'A formatter MUST return a string value!'.
	