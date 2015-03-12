type propagation
makeConnections
	statements 
		do: [:each | 
			each makeConnections.
			each connectReturnNodesTo: self]