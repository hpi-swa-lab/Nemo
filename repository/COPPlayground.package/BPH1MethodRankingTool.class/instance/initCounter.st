as yet unclassified
initCounter

	self counter: (COPRankingSpike new
		initializeClasses: self createClassesList
		without: Dictionary new
	).