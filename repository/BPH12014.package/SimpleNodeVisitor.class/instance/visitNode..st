as yet unclassified
visitNode: aNode
	((aNode start >= (self caretPosition)) and: [self enclosingNode isNil]) ifTrue: [self enclosingNode: self lastAcceptedNode].
	self lastAcceptedNode: aNode.
	^ super visitNode: aNode