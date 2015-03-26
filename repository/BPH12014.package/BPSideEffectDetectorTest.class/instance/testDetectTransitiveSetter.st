testing
testDetectTransitiveSetter

	self assert: (detector isSideEffecting: (MethodReference class: self class selector: #transitiveSetter))