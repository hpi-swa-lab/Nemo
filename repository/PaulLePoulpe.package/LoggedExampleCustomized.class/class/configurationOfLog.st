as yet unclassified
configurationOfLog
	<logConfiguration>
	^ [
	     :builder |
	     builder forClass: LoggedExampleCustomized 
			     useLevel:#warn 
			     showingLogAs: ('%pih | %tstmp | %tag #%class >> %selector [%log]' asPatternFormatter) 
			     into: { Transcript asLogWriter . Transcript asLogWriter } asLogWriter.
	].

