as yet unclassified
receptor
	^ TiMessageNode new
				setSelector: #braceStream:
				receiver: (contextBuilder  buildLiteral: Array)
				arguments: (Array with: (contextBuilder  buildLiteral: elements size))
	