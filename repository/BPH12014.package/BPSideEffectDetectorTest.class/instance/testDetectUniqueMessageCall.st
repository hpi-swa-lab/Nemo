testing - todo
testDetectUniqueMessageCall
	self flag: #todo
	"This should be detectable as not side-effecting via implementors"
	"self deny: (detector isSideEffecting: (self referenceFor: #uniqueMessageCall))"