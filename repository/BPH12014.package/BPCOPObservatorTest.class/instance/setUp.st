as yet unclassified
setUp

	self observer: (BPCOPObserver new
		addMethod: (BPObservationTestClass methodDict at: #methodWith:and:) methodReference
	).