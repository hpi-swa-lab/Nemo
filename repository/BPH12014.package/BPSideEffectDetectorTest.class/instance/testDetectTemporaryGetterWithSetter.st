testing
testDetectTemporaryGetterWithSetter

	self assert: (detector isSideEffecting: (MethodReference class: self class selector: #temporaryGetterWithSetter))