as yet unclassified
visitNode: aNode

	((aNode start <= (self caretPosition - 1)) and: [aNode stop >= (self caretPosition - 1)])
		ifTrue: [
			self putEnclosingNode: aNode.
		].

	^ super visitNode: aNode