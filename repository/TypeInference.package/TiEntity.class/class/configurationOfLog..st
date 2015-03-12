as yet unclassified
configurationOfLog:builder
	<logConfiguration>
	^   builder forClass: self
			     useLevel: #debug
			     showingLogAs: ('%pih | %tstmp | %tag #%class >> %selector [%log]' asPatternFormatter) 
			     into: Transcript asLogWriter . 