type propagation
makeConnections
	receiver makeConnections.
	messages do:[:each | each makeConnections].
	messages last connectTo: self.