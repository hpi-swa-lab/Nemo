testing
testDetectGetter

	self deny: (detector isSideEffecting: (MethodReference class: self class selector: #getter))