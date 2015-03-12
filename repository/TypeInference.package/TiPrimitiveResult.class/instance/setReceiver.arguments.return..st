building
setReceiver: aTypeSet arguments: argTypeSets return: returnTypeSet
	self debug:['successful primitive'].
	super setReceiver: aTypeSet arguments: argTypeSets return: returnTypeSet.
	successFlag := true.

