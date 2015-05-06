testing
testDetectSetter

	self assert: (detector isSideEffecting: (self referenceFor: #setter))