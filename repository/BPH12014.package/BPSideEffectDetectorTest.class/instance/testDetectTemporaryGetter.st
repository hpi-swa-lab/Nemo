testing
testDetectTemporaryGetter

	self deny: (detector isSideEffecting: (MethodReference class: self class selector: #temporaryGetter))