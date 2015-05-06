testing
testDetectSetter2

	self assert: (detector isSideEffecting: (self referenceFor: #setter:))