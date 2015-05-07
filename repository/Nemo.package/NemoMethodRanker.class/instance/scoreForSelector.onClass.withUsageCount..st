scoring
scoreForSelector: selector onClass: aClass withUsageCount: anInteger
	
	requestedCount := requestedCount + 1.
	^ anInteger / ((NemoSelectorInfoStore for: selector) ifNil: [ ^ 0 ])