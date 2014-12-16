comparing
= anotherPartialMethod
	
	^ anotherPartialMethod class == self class
		and: [ (layers = anotherPartialMethod internalLayers) & (self selector = anotherPartialMethod selector) & (self methodClass = anotherPartialMethod methodClass) ]