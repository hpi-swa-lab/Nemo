testing
testDetectTemporaryGetter

	self deny: (detector isSideEffecting: (self referenceFor: #temporaryGetter))