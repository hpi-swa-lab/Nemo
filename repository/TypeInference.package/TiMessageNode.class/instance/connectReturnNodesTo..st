type propagation
connectReturnNodesTo: aBlockOrMethodNode
	receiver connectReturnNodesTo: aBlockOrMethodNode.
	arguments do: [:each |  each connectReturnNodesTo: aBlockOrMethodNode]