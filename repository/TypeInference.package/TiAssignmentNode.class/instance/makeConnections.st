type propagation
makeConnections
	(variable isKindOf: TiReceiverVariable )ifTrue:[ self halt]	.
	conditionalContext  ifTrue: [
		expression makeConnections; 	connectTo: variable currentSlot; connectTo: self
	] ifFalse: [
		" Common method scope. "
		expression makeConnections; 	connectTo: variable newSlot; connectTo: self
	].