*Nemo-Util
isNodeSeparator
	^ self isSeparator
		or: [	 self = $( ]
		or: [ self = $) ]
		or: [	 self = $[ ]
		or: [ self = $] ]
		or: [	 self = $. ]