subclassed layers
resetInstance
	"Reset the layer-instance of this class. Only applicable for subclasses."
	
	self checkIsSubclass.
	^ self removeGlobalInstanceNamed: self globalLayerName