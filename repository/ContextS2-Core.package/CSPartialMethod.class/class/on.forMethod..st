instance creation
on: aLayer forMethod: aMethod
	
	^ (self
		selector: aMethod selector
		class: aMethod methodClass)
		method: aMethod;
		layers: aLayer;
		yourself