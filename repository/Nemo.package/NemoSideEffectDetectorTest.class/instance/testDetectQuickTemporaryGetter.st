testing
testDetectQuickTemporaryGetter

	self deny: (detector quickCheck: (self referenceFor: #temporaryGetter))