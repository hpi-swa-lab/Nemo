use level
useLevel: aLevel  
	^self filter: (LevelLogFilter for:aLevel) showingLogAs: #simple into: (Transcript asLogWriter).
			