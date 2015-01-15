as yet unclassified
visitNode: aNode
	(aNode stop <= self caretPosition) ifTrue: [
		self enclosingNode
			ifNil: [self enclosingNode: aNode]
			ifNotNil: [((self caretPosition - aNode stop) <= (self caretPosition - self enclosingNode stop))
						ifTrue: [self enclosingNode: aNode]]].

	^ super visitNode: aNode