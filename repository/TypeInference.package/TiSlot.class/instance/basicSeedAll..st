type propagation
basicSeedAll: aTypeSet
	self debugSender.
	aTypeSet do: [:each | self basicSeed: each]
