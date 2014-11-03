as yet unclassified
createUniqueLayerName

	self class layerCounter: (self class layerCounter + 1).
	^ 'COPInterceptorLayer' , (self class layerCounter asString)