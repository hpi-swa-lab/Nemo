processing
run

	self process.
	self nextFilter ifNil: [^ self].
	self dictionary keysAndValuesDo: [ :key :value |
		self nextFilter at: key put: value.
	].
	^ self nextFilter run