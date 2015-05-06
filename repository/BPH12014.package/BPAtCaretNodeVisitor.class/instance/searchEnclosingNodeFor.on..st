as yet unclassified
searchEnclosingNodeFor: anInteger on: aNode

	self caretPosition: anInteger;
		visitNode: aNode.
	^ self enclosingNode ifNil: [aNode].
	
	