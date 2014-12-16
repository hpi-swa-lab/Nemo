caching
flushCache

	layerDict := IdentityDictionary new.
	self allInvolvedLayers do: [:layer | layerDict at: layer put: (self partialMethodFor: layer)].