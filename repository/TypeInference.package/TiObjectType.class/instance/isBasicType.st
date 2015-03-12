testing
isBasicType
	^ exactClass isVariableByteOrWord 
	or: [exactClass isFixed & self exactClass instSize = 0]