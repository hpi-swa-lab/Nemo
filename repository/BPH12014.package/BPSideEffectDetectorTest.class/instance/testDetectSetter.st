testing
testDetectSetter

	self assert: (detector isSideEffecting: (MethodReference class: self class selector: #setter))