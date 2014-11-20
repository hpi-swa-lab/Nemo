as yet unclassified
toggleObserve

	self isObserving: self isObserving not.
	self isObserving ifTrue: [
		self initObserver observer start.
		self updateIntervalHandler: (
			(BPIntervalHandler newEvery: 5000 execute: [ :intervalHandler |
				self updateList.]
			) start).
	] ifFalse: [
		self updateIntervalHandler stop.
		self observer stop.
		self observer: nil.
	].