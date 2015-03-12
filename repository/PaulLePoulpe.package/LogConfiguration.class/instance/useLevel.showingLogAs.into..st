use level
useLevel: aLevel showingLogAs: aFormatter into:aWriter 
	^self filter: (LevelLogFilter for:aLevel) showingLogAs: aFormatter into:aWriter.
			