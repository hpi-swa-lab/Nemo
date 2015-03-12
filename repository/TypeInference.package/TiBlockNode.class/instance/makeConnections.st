type propagation
makeConnections
	"note that block types are not added to the type memory"
	analyzedBlock makeConnections.
	self seed: (TiBlockType new setBlockNode: self).
