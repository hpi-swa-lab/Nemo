use category
useCategory: aCategory into:aWriter 
	^self filter: (CategoryLogFilter for: aCategory ) showingLogAs: #simple into:aWriter.
			