testing
testDetectTemporaryGetterWithSetter

	self assert: (detector isSideEffecting: (self referenceFor: #temporaryGetterWithSetter))