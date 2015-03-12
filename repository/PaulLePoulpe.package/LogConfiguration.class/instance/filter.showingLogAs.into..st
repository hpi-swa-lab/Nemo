base
filter: aFilter showingLogAs: aFormatter into:aWriter
| formatter writer | 
	formatter := aFormatter = #simple ifTrue: [ SimpleLogFormatter instance]  ifFalse: [ aFormatter ].
	writer := aWriter  = #stdout ifTrue: [ LogStdoutWriter instance]  ifFalse: [ aWriter ].
	writer := aWriter  = #mem ifTrue: [ LogMemoryWriter instance]  ifFalse: [ writer ].
	
	^LogProcessor new 
				filter: aFilter;
				formatter: formatter; 
				writer: writer;
				yourself.
				
			