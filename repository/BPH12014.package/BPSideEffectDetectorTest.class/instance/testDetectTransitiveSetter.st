testing
testDetectTransitiveSetter

	self assert: (detector isSideEffecting: (self referenceFor: #transitiveSetter))