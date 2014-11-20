as yet unclassified
initObserver

	self observer: (COPTypeObservation new
		initializeClasses: self createClassesList
		without: Dictionary new
	).