accessing
layers: anObject
	"Set the value of layer"

	anObject ifNotNil: [ anObject do: [ :symbol | CSLayer layerNamed: symbol ] ].
	layers := anObject