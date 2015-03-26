testing
testDetectSetter2

	self assert: (detector isSideEffecting: (MethodReference class: self class selector: #setter:))