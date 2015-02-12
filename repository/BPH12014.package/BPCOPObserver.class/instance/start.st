as yet unclassified
start

	self started ifTrue: [^ self].
	super start.
	self layerName asSymbol activateLayerInCurrentProcess.