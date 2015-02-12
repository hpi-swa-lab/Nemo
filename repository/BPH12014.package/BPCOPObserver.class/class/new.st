as yet unclassified
new

	| newInstance |
	newInstance := super new.
	self instances at: newInstance instanceID put: newInstance.
	^ newInstance