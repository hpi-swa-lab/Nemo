executing
methodChainFor: activeLayers
	"Chain together all partial methods that are currently active.
	Chain is ordered in the way the layers have been activated.
	Caches by key of activeLayers"
	| methodChain m |
	^ layerDict at: activeLayers ifAbsentPut: [
		methodChain := OrderedCollection new: activeLayers size + 1.
		activeLayers do: [:layer |
			(m := layerDict at: layer ifAbsent: []) == nil ifFalse: [methodChain add: m]].
		(m := self actualBaseMethod) == nil ifFalse: [methodChain add: m].
		methodChain]