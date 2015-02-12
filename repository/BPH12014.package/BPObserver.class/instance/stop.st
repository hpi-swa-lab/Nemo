as yet unclassified
stop

	self started ifFalse: [^self].
	self started: false.
	self methods do: [ :aMethodReference |
		self stopObservationOfMethod: aMethodReference.
	].