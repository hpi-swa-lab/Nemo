type propagation
makeConnections
	| argSlot |
	typeSet := Set new: 2.
	actualArgument makeConnections.
	argSlot := actualArgument slot.
	resultSlot := actualArgument argumentResultSlot.
	argSlot connectTo: self.