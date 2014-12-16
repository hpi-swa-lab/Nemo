*contexts2-core-override-instance creation
generateMethodFromNode: aMethodNode trailer: bytes
	
	| method |
	method := aMethodNode generate: bytes.
	(method pragmas anySatisfy: [:each | each keyword = CSLayeredMethod pragmaKeyword ])
		ifTrue: [method := method asPartialMethod].
	^ self method: method node: aMethodNode.