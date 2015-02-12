as yet unclassified
stop

	self started ifFalse: [^ self].
	super stop.
	self layerName asSymbol deactivateLayerInCurrentProcess.