visiting
visitAssignmentNode: anAssignmentNode

	sideEffecting ifTrue: [ ^ self ].
	sideEffecting := self isTemporaryNode: anAssignmentNode variable.
	super visitAssignmentNode: anAssignmentNode.