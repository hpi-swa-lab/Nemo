type propagation
connectTo: targetTiNode
	"I will pass all my atomic types to the targetTiNode.
	More formally: Type[this node] =< Type[targetTiNode]
	where '=<' reads subtype "
	self subclassResponsibility