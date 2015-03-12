use category
useCategory: aCategory 
	^self filter: (CategoryLogFilter for: aCategory ) showingLogAs: #simple into: (Transcript asLogWriter).
			