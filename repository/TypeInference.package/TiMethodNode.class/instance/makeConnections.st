type propagation
makeConnections
	statements do:	[
			:each | 
			each inAConditionalContext: self conditional. "specifies if the context of the method is conditional. Then, when iftrue: iffalse: is analyzed you knowit "
			each makeConnections.
			each connectReturnNodesTo: self.
	].