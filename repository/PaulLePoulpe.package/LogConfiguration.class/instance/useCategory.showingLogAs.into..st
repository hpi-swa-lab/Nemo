use category
useCategory: aCategory  showingLogAs: aFormatter into:aWriter 
      ^self filter: (CategoryLogFilter for: aCategory ) showingLogAs: aFormatter into:aWriter.
			