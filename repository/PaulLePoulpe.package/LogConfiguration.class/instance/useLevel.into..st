use level
useLevel: aLevel  into:aWriter 
	^self filter: (LevelLogFilter for:aLevel) showingLogAs: #simple into:aWriter.
			