building
setReceiver: aTypeSet arguments: argTypeSets
	| returnTypeSet |
	self debug:['unsuccessful primitive'].
	returnTypeSet := Set new: 2.
	self setReceiver: aTypeSet arguments: argTypeSets return: returnTypeSet.


