helpers
isTemporaryNode: aNode
	^ (aNode parents
		detect: [ :node |
			node isSequence and: [ node temporaries includes: aNode ] ]
		ifNone: []) isNil