as yet unclassified
run: aBlock

	self activate.
	aBlock ensure: [
		self deactivate.
	].