testing
testDetectQuickConstantGetter

	self deny: (detector quickCheck: (self referenceFor: #constantGetter))