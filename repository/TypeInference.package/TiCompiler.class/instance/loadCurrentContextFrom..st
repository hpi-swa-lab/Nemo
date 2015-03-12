replication
loadCurrentContextFrom: anAnalyzedMethod
	anAnalyzedMethod ifNotNil: [
		currentContextBuilder := anAnalyzedMethod context.
	]