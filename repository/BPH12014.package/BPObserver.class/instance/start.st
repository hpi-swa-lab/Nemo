as yet unclassified
start

	self started ifTrue: [^self].
	self started: true.
	self methods do: [ :aMethodReference |
		self startObservationOfMethod: aMethodReference.
	].