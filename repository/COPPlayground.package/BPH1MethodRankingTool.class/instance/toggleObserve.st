as yet unclassified
toggleObserve

	self isObserving: self isObserving not.
	self isObserving ifTrue: [
		Transcript show: 'Start Counting
		'.
		self initCounter counter startCounting.
		self updateIntervalHandler: (
			(BPIntervalHandler newEvery: 5000 execute: [ :intervalHandler |
				self updateRanking.]
			) start).
	] ifFalse: [
		Transcript show: 'Stop Counting
		'.
		self updateIntervalHandler stop.
		self counter stopCounting.
		self counter: nil.
	].