testing
testDetectGetter

	self deny: (detector isSideEffecting: (self referenceFor: #getter))