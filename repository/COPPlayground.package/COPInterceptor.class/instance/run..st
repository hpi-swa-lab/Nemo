as yet unclassified
run: aBlock

	self interceptMethods.
	self layerName asSymbol withLayerDo: [aBlock ensure: [
		self releaseMethods.
	]].