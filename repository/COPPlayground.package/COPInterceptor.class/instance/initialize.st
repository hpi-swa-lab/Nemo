as yet unclassified
initialize

	self interceptions: OrderedCollection new.
	self interceptionBlockHashes: OrderedCollection new.
	self layerName: self createUniqueLayerName.