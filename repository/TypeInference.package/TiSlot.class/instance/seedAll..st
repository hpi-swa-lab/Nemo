type propagation
seedAll: aTypeSet
	self debugSender.
	aTypeSet do: [:each |  self seed: each]
