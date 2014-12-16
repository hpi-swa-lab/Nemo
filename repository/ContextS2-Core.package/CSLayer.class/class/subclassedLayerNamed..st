private
subclassedLayerNamed: aSymbol
	
	^ self allSubclasses
		detect: [ :cl | cl globalLayerName = aSymbol ]
		ifNone: [ nil ]