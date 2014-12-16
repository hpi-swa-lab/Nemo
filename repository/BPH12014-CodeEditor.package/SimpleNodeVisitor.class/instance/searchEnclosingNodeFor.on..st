as yet unclassified
searchEnclosingNodeFor: aPosition on: aNode
	| node |
	node := self
		caretPosition: aPosition;
		visitNode: aNode;
		enclosingNode.
	^ node ifNil: [self lastAcceptedNode]
	
	