visiting
putEnclosingNode: aNode

	self enclosingNode ifNotNil: [
		((self enclosingNode start > aNode start) or: [(self enclosingNode stop < aNode stop)])
			ifTrue: [ ^ self ].
	].
	self enclosingNode: aNode